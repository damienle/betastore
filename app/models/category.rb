class Category< ActiveRecord::Base
  has_many :product_categories
  has_many :products, :through => :product_categories

  validates :name, presence: true
  validate :method_that_work

  def method_that_work


  end
end
