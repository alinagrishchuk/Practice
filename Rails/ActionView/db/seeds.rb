if Article.count == 0
  500.times do
    Article.create(title: Faker::Hipster.sentence ,body: Faker::Lorem.sentences(3).join(' '))
  end
end



if Category.count == 0
  Category.create!(name: "Beverages")
  Category.create!(name: "Books")
  Category.create!(name: "Breads")
  Category.create!(name: "Canned Foods")
  Category.create!(name: "Clothes")
  Category.create!(name: "Computers")
  Category.create!(name: "Dry Foods")
  Category.create!(name: "Frozen Foods")
  Category.create!(name: "Furniture")
  Category.create!(name: "Headphones")
  Category.create!(name: "Magazines")
  Category.create!(name: "Music")
  Category.create!(name: "Other Electronics")
  Category.create!(name: "Pastas")
  Category.create!(name: "Portable Devices")
  Category.create!(name: "Produce")
  Category.create!(name: "Snacks")
  Category.create!(name: "Software")
  Category.create!(name: "Televisions")
  Category.create!(name: "Toys")
  Category.create!(name: "Video Games")
  Category.create!(name: "Video Players")
  Category.create!(name: "Videos")
end

electronics = Category.first_or_create(name: "Electronics")
toys =  Category.first_or_create(name: "Toys & Games")
clothes = Category.first_or_create(name: "Clothes")
furniture =  Category.first_or_create(name: "Furniture")
foods =  Category.first_or_create(name: "Foods")

Product.create!(name: "Chunky Bacon", price: 3.99, released_on: "2011-07-15", category: Category.find_by_name!("Dry Foods"))
Product.create!(name: "Flux Capacitor", price: 19.55, released_on: "2011-07-15", category: Category.find_by_name!("Other Electronics"))
Product.create!(name: "Technodrome", price: 12.49,released_on: "2011-07-15", category: Category.find_by_name!("Toys"))
Product.create!(name: "TextMate 2", price: 74.99,released_on: "2011-07-15", category: Category.find_by_name!("Software"))
Product.create!(name: "Settlers of Catan", price: 29.95, released_on: "2011-07-15", category: toys)
Product.create!(name: "DVD Player", price: 82.97, released_on: "2011-07-18", category: electronics)
Product.create!(name: "Red Shirt", price: 12.49, released_on: "2011-07-25", category: clothes)
Product.create!(name: "Black Leather Couch", price: 399.99, released_on: "2011-07-27", category: furniture)
Product.create!(name: "Oak Coffee Table", price: 223.99, released_on: "2011-07-28", category: furniture)
Product.create!(name: "Technodrome", price: 27.99, released_on: "2011-07-28", category: toys)
Product.create!(name: "Oh's Cereal", price: 3.95, released_on: "2011-07-29", category: foods)
Product.create!(name: "Game Console", price: 299.95, released_on: "2011-08-02", category: toys)
Product.create!(name: "Video Game", price: 29.95, released_on: "2011-08-05", category: toys)
Product.create!(name: "Lawn Chair", price: 34.99, released_on: "2011-08-05", category: furniture)
Product.create!(name: "Dog Toy Bone", price: 2.99, released_on: "2011-08-08", category: toys)
Product.create!(name: "Heated Blanket", price: 27.95, released_on: "2011-08-09", category: furniture)
Product.create!(name: "Flux Capacitor", price: 19.55, released_on: "2011-08-12", category: electronics)
Product.create!(name: "Chocolate Pie", price: 3.14, released_on: "2011-03-14", category: foods)
Product.create!(name: "Acoustic Guitar", price: 1025.00, released_on: "2011-08-23", category: electronics)
Product.create!(name: "Model Enterprise", price: 27.99, released_on: "2011-08-27", category: toys)
Product.create!(name: "Agricola", price: 45.99, released_on: "2011-08-28", category: toys)
Product.create!(name: "Stone Age", price: 34.99, released_on: "2011-08-30", category: toys)
Product.create!(name: "7 Wonders", price: 28.75, released_on: "2011-09-03", category: toys)
Product.create!(name: "Millennium Falcon", price: 3597200.00, released_on: "2011-09-07", category: electronics)
Product.create!(name: "Answer to Everything", price: 42.00, released_on: "2011-09-08", category: electronics)
Product.create!(name: "Box Kite", price: 63.00, released_on: "2011-09-10", category: toys)
Product.create!(name: "1000 Piece Jigsaw Puzzle", price: 14.99, released_on: "2011-09-17", category: toys)
Product.create!(name: "TextMate 2", price: 75.00, released_on: "2011-09-22", category: electronics)
Product.create!(name: "Rubber Ducky", price: 4.75, released_on: "2011-09-25", category: toys)
Product.create!(name: "Unicorn Action Figure", price: 8.75, released_on: "2011-09-25", category: toys)
Product.create!(name: "Rack", price: 32.49, released_on: "2011-09-28", category: furniture)
Product.create!(name: "Model Train Rails", price: 45.00, released_on: "2011-10-01", category: toys)
Product.create!(name: "CanCan Music Record", price: 2.99, released_on: "2011-10-04", category: electronics)



if Author.count == 0
  200.times do
    Author.create!(name: Faker::Name.name)
  end

  ["Erich Gamma", "Richard Helm", "Ralph Johnson", "John M. Vlissides"].each do |name|
    Author.create!(name: name)
  end
end




Order.delete_all
generator = proc do |start_time, end_time, shipping|
  time = Time.at(rand(end_time.to_i - start_time.to_i) + start_time.to_i)
  card_number =  Faker::Business.credit_card_number
  price = rand(200) + 10
  Order.create!(
         order_number: Faker::Number.number(10),
         card_last_four: card_number[-4,4],
         amount: Faker::Commerce.price,
         credit_card_number: card_number,
         price: price,
         credit_card_expires_on: Faker::Date.forward(100),
         purchased_at: time,
         shipping: rand(shipping)
  )
end

200.times { generator.call(10.days.ago, Time.zone.now.end_of_day, 1) }
500.times { generator.call(1.month.ago, Time.zone.now.end_of_day, 2) }
Order.create!(price: 10, purchased_at: 1.month.ago.beginning_of_day, shipping: true)


