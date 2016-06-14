class Pin < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ImageUploader
  paginates_per 10

  belongs_to :board

  validates_presence_of :board
end
