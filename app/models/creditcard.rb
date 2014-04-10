class Creditcard < ActiveRecord::Base
  belongs_to :customer
  has_many :orders
  def expiry=(expiry)

    self.expire_on = Date.strptime(expiry, '%m/%y')+ 1.month
  end
  validates :cardnum, presence: true, format: { with: //}, length: { is: 15 },numericality: { only_integer: true }
end
