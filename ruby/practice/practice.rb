require 'faker'
require "awesome_print"

def string_shuffle(s)
  s.split('').shuffle.join
end
p string_shuffle("foobar")

class String
  def shuffle
    self.split('').shuffle.join
  end
end

p 'foobar'.shuffle

person1 = {first: Faker::Name.first_name , last: Faker::Name.last_name}
person2 = {first: Faker::Name.first_name , last: Faker::Name.last_name}
person3 = {first: Faker::Name.first_name , last: Faker::Name.last_name}

params = {father: person1, mother: person2, child: person3}

p params[:father][:first]
pp params