class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if options[:fields].any?{|field| record.send(field) == 'Evil'}
      record.errors[:base] << 'This person is evil'
    end
  end
end

class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :terms_of_service, acceptance: true
  validates_with GoodnessValidator, fields: [:name,]
  validates :name, length: {minimum: 5}, if: :long_email?

  with_options if: :long_email? do |person|
    person.validates :email_confirmation, presence: true
    person.validates :email, confirmation: true
  end

  before_create do
    self.name.capitalize!
  end

  after_initialize do
    self.name = "test name" unless !self.name.blank?
    self.email= "testemail@test.com" if self.email.blank?
  end


  def long_email?
    email.length > 5 unless email.nil?
  end

end



