hat       = Product.create!(name: 'hat',     price: 8.99,image_url: "/images/products/hat.jpg")
hoodie    = Product.create!(name: 'hoodie',  price: 22,image_url:   "/images/products/hoodie.jpg")
phonecase = Product.create!(name: 'case',    price: 5,image_url:    "/images/products/case.jpg")
journal   = Product.create!(name: 'journal', price: 2,image_url:    "/images/products/journal.jpg")
shirt     = Product.create!(name: 'shirt',   price: 12,image_url:   "/images/products/shirt.jpg")
sticker   = Product.create!(name: 'sticker', price: 1.99,image_url: "/images/products/sticker.jpg")

clothing = Category.create!(name: 'Clothing')
headwear = Category.create!(name: 'Head Wear')
misc = Category.create!(name: 'Misc')

clothing.products << hat  #add the id of hat and the category into the product category
headwear.products << hat

puts "hat categories: #{hat.categories.map{|c| c.name}}"
me = Customer.create!(name: 'Damien', email: 'me@yahoo.com')

me.creditcards.create(cardnum: '34343776876', expiry: '3/17')
User.create!(email: 'mycauhoi@gmail.com', password: 'secret')