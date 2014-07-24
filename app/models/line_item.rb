class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :order, inverse_of: :line_items

  before_validation :set_price
  after_save :increment_order_total_amount

  validates :order, :product_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, allow_blank: true }


  def set_price
    # self.price ||=0
    self.price = product.price

  end

  def total_price
    # self.price ||=0
    # self.quantity ||=0
    price * quantity
  end

  def increment_order_total_amount
    order.total_amount ||= 0
    order.total_amount += total_price
    order.save
  end
end
