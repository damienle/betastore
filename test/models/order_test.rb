require 'test_helper'

class OrderTest < ActiveSupport::TestCase



def test_total_revenue

  assert_equal 100, Order.total_revenue
end
  # test "the truth" do
  #   assert true
  # end
end
