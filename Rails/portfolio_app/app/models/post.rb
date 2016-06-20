class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :content,:title
end
