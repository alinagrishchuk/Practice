require 'faker'
FactoryGirl.define do
  factory  :user do
  email     "person@example.com"
  password  'foobar12'
  password_confirmation 'foobar12'
  end
end