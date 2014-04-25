class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  has_many :product_categories
  has_many :categories, :through => :product_categories

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  # validates :image_url, presence: true
  scope :search, -> (q) { where('name like ?', "%#{q}%") }
  scope :min_price, -> (price) { where('price >= ?', price) }
  scope :max_price, -> (price) { where('price <= ?', price) }

  # use scope is better
  # def self.search(q)
  #   # ilike mean will match lower case.
  #   where('name ilike ?', "%#{q}%")
  # end
end
