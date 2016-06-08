class Micropost < ActiveRecord::Base
  belongs_to :user

  validates :content, :length => { maximum: 140}
  validates :user_id, :content, presence: true

  default_scope -> { order('created_at DESC') }
end
