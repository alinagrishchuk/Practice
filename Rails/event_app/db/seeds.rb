
user = User.first

100.times do
  user.organized_events.create(
         title:       Faker::Hipster.sentences(1)[0],
         start_date:  Faker::Time.between(2.days.ago, Date.today, :all),
         end_date:    Faker::Time.forward(23, :all) ,
         location:    "#{Faker::Address.street_address} #{Faker::Address.building_number}",
         agenda:      Faker::Hipster.paragraphs[0],
         address:     "#{Faker::Address.state} #{Faker::Address.city}",
         all_tags:    Faker::Internet.slug(nil,',')
  )
end