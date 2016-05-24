Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['FACEBOOK_SECRET'],
           scope: 'public_profile', info_fields: 'email,name,link,about,', display: 'page', image_size: 'square'
end