class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :product_categories
  has_many :categories, :through => :product_categories

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :image_url, presence: true

end
