class Order < ActiveRecord::Base
  has_many :line_items, inverse_of: :order
  # has_many :products, :through => :line_items

  belongs_to :customer
  belongs_to :creditcard, inverse_of: :orders

  validates :creditcard, presence: true
  validates :customer_id, presence: true
  validate :credit_card_belongs_to_customer

  accepts_nested_attributes_for :creditcard
  accepts_nested_attributes_for :line_items

  after_create :charge
  # after_save :send_email_to_customer
  #
  # def self.recent
  #   where("placed_at > ?", 7.days.ago)
  # end

  # def self.by(customer)
  #   where(customer_id: customer.id)
  # end
  def self.from_cart(cart)
     order = new
     cart.each do |product_id, quantity|
       order.line_items.build(
         product_id: product_id,
         quantity: quantity
       )
     end
     order.calculate_totals
     order
   end

   def calculate_totals

     self.total_amount = line_items.inject(0) do |sum, li|
       li.set_price
        sum + li.total_price
     end
   end


  def self.total_revenue
    # Order.connection.select_all("select sum(total_amount) from orders")
    connection.select_value("select sum(total_amount) from orders").to_f
    # sum(:total_amount)

  end
  def self.total_revenue_per_customer
    connection.select_all("select customer_id, sum(total_amount) FROM orders GROUP BY customer_id")
# group(:customer_id).sum(:total_amount)
  end

  def credit_card_belongs_to_customer
    if customer_id && credit_card_id
      unless customer_id == credit_card.customer_id
        errors.add(:credit_card_id, "does not belong to this customer")
      end
    end
  end

def charge

  result = Braintree::Transaction.sale(
  :amount => total_amount,
  :credit_card => {
    :number => creditcard.cardnum,
    :expiration_month => creditcard.expiration_month,
    :expiration_year => creditcard.expiration_year
  }
)

if result.success?
  logger.info "Transaction ID: #{result.transaction.id}"
  # status will be authorized or submitted_for_settlement
  logger.info "Transaction Status: #{result.transaction.status}"
else
  logger.error "Message: #{result.message}"
  if result.transaction.nil?
    # validation errors prevented transaction from being created
    p result.errors
  else
    logger.error "Transaction ID: #{result.transaction.id}"
    # status will be processor_declined, gateway_rejected, or failed
    logger.error "Transaction Status: #{result.transaction.status}"
  end
end

end


  # def increment_total_amount(amount)
  # update(total_amount: total_amount.to_f + amount)

  # end

  # def calculate_total_amount
  #   self.total_amount = line_items.inject(0) do |sum,li|
  #     sum + li.total_price
  #   end
  # end
end
