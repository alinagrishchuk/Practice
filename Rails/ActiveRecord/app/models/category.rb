class Category < ActiveRecord::Base
  validates :name, exclusion: {in: %w{staff}}
  validates :name, format: {with: /[A-Z]\w+/}
  validates :name, :description, length: {minimum: 5}
end
