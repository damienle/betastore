class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, :through => :line_items

  belongs_to :customer
  belongs_to :creditcard

  validates :creditcard_id, presence: true
  validates :customer_id, presence: true

  # after_save :send_email_to_customer
  #
  # def self.recent
  #   where("placed_at > ?", 7.days.ago)
  # end

  # def self.by(customer)
  #   where(customer_id: customer.id)
  # end

  def self.total_revenue
    # Order.connection.select_all("select sum(total_amount) from orders")
    connection.select_value("select sum(total_amount) from orders").to_f
    # sum(:total_amount)

  end
  def self.total_revenue_per_customer
    connection.select_all("select customer_id, sum(total_amount) FROM orders GROUP BY customer_id")
# group(:customer_id).sum(:total_amount)
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
