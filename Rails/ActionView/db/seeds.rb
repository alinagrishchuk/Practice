# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

Product.create!(name: "Chunky Bacon", price: 3.99, category: Category.find_by_name!("Dry Foods"))
Product.create!(name: "Flux Capacitor", price: 19.55, category: Category.find_by_name!("Other Electronics"))
Product.create!(name: "Technodrome", price: 12.49, category: Category.find_by_name!("Toys"))
Product.create!(name: "TextMate 2", price: 74.99, category: Category.find_by_name!("Software"))


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


