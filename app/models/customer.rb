class Customer < ActiveRecord::Base
  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :creditcards

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
