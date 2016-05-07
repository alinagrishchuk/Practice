class Category < ActiveRecord::Base
  has_and_belongs_to_many :products

  validates :name, exclusion: {in: %w{staff}}
  validates :name, format: {with: /[A-Z]\w+/}
  validates :name, :description, length: {minimum: 5}

  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Category destroyed'
  end
end
