require 'test_helper'

class AdminProductTest < ActionDispatch::IntegrationTest

def test_admin_product
  visit "/admin/products"
  click_link("Create new product")
  fill_in "Name", with: "Awesome"
  fill_in "Price", with: "4.77"
  click_on "save"
  # save_and_open_page
  assert page.has_content?(/Product.*was created/)
  click_link("Awesome")
  click_link("Edit")
  fill_in "Price", with: "12.77"
  click_on "save"

  assert page.has_content?('12.77')
  assert page.has_content?('is updated')

  click_link("Awesome")
  assert page.has_content?('12.77')
  click_on("delete")

  refute page.has_content?('Awesome')







  # fill_in "Find out when we go live", with: 'test@example.com'
  # click_on "Sign Up"
  # save_and_open_page
  # assert page.has_content?('Subscription was successfully created.')
  # assert_equal 'test@example.com', Subscription.last.email
end

end