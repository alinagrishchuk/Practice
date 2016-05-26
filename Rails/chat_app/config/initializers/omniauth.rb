Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['FACEBOOK_SECRET'],
           scope: 'public_profile',
           info_fields: 'email,name,link,about,birthday,first_name,last_name,website',
           display: 'page',
           image_size: 'square'
end