if Post.count == 0
  puts 'add posts'
  300.times do
    Post.create!(title: Faker::Hipster.sentence, content: Faker::Hipster.paragraphs(4).join("\n"))
  end
end

if Project.count == 0
  puts 'add project'
  300.times do
    Project.create!(title: Faker::App.name, description: Faker::Hipster.paragraphs(2).join("\n"), link: "http://localhost:3000/")
  end
end