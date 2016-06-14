class Pin < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ImageUploader
  paginates_per 10

  belongs_to :board

  validates_presence_of :board

  def repin_post(board_id)
    pin = Pin.new
    pin.name = self.name
    pin.board_id = board_id
    pin.image = self.image
    pin
  end
end
