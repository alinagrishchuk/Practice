class Author < ActiveRecord::Base
  has_many :authorships
  has_many :books, through: :authorships

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "invalid email format"

  def self.tokens query
    authors = Author.where("name like ?", "%#{query}%")
    if authors.empty?
      [{id: "<<<#{query}>>>", name: "New: \"#{query}\" "}]
    else
      authors
    end
  end

  def self.ids_from_tokens tokens
    tokens.gsub!(/<<<(.+?)>>>/) {create!(name: $1).id }
    tokens.split(',')
  end

end
