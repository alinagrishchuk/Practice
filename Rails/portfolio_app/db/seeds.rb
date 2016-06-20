if Post.count == 0
  300.times do
    puts 'add posts'
    Post.create!(title: Faker::Hipster.sentence, content: Faker::Hipster.paragraphs(4).join("\n"))
  end
end