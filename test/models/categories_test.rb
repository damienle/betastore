require 'test_helper'

class CategoriesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_save_success
    category = Category.new(name: 'test')
    assert category.save

  end

  def test_save_failure
    category = Category.new
    refute category.save
    assert_equal ["can't be blank"], category.errors[:name]
  end
end
