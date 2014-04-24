class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :creditcards
  has_secure_password validations: false
  # validation is true if you have two password field and need to check for correct
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  after_create :send_verification_email

   def self.verify(token)
     customer_id = Rails.application.message_verifier('customer').verify(token)
     customer = Customer.find(customer_id)
     customer.update!(verified_at: Time.current) unless customer.verified_at
     customer
   rescue
     nil
   end

   def send_verification_email
     CustomerMailer.confirm_email(self).deliver
   end

end
