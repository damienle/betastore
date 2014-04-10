Customer.delete_all
Creditcard.delete_all
Order.delete_all
LineItem.delete_all


# 100.times do
#   product = Product.create(name: Faker::Commerce.product_name, price: Faker::Commerce.price)
#   puts "product create Name: #{product.name} and #{product.price} "
# end

bar = ProgressBar.new("Progress bar",100)



product_ids = Product.pluck(:id)

100.times do
  customer = Customer.create!(name: Faker::Name.name, email: Faker::Internet.email)

  customer.creditcards.create!( cardnum: Faker::Business.credit_card_number,
                                expire_on: Faker::Business.credit_card_expiry_date)

  (rand(5)+1).times do
    # order = Order.create()
    # customer.orders << order
    order = customer.orders.create!
    # puts "Place order #{order.id}"
    # duplicate the array of products
    pids = product_ids.dup

      rand(1..5).times do
          # line_item = LineItem.create(quantity: rand(1..5),
          #                             product_id: rand(1..100))
          # order.line_items << line_item
          li = order.line_items.create!(product_id: pids.shuffle!.pop,
                                        quantity: rand(5) + 1
                                        )
          # puts li.inspect

          li.increment_order_total_amount
      end


      # Order.total_revenue

      # order.total_amount = order.line_items.inject(0){|sum,li| sum + li.total_price}
      # order.calculate_total_amount
      # puts "Order total amount #{order.total_amount}"
      # order.save!


  end
  bar.inc
end
  bar.finish

