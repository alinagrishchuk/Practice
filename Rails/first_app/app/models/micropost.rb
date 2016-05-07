class Micropost < ActiveRecord::Base
  validates :content, :length => {maximum: 150, minimum: 10}
  belongs_to :user
end
