require 'faker'
FactoryGirl.define do
  factory :project do |f|
    f.title         { Faker::App.name}
    f.description   { Faker::Hipster.paragraphs(2).join("\n") }
    f.link          { "http://localhost:3000/" }
  end
end