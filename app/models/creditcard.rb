class Creditcard < ActiveRecord::Base
  belongs_to :customer
  has_many :orders, inverse_of: :creditcard
  def expiry=(expiry)

    self.expire_on = Date.strptime(expiry, '%m/%y')+ 1.month
  end
  validates :cardnum, presence: true, format: { with: //}, length: { is: 15 },numericality: { only_integer: true }



  def expiration_month
    expiration_date.split('/').first


  end

  def expiration_year
    expiration_date.split('/').last


  end


end
