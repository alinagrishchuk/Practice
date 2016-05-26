class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth)
      provider = auth.provider
      uid = auth.uid
      info = auth.info.symbolize_keys!
      raw_info = auth.extra[:raw_info].symbolize_keys!
      user = User.find_or_initialize_by(uid: uid, provider: provider)
      user.name = info.name
      user.avatar_url = info.image
      user.profile_url = info.urls.send(provider.capitalize.to_sym)
      user.email = info.email
      user.first_name = info.first_name
      user.last_name = info.last_name
      user.link = raw_info.link
      user.about = raw_info.about
      user.website =  raw_info.website
      user.save!
      user
    end
  end

  has_many :comments, dependent: :delete_all
end
