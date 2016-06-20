require 'faker'
FactoryGirl.define do
  factory :post do |f|
    f.content   { Faker::Hipster.paragraphs(4).join("\n") }
    f.title     { Faker::Hipster.sentence }
  end
end