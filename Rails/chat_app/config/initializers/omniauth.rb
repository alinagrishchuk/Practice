Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['FACEBOOK_SECRET'],
           scope: 'email', info_fields: 'email,name,link', display: 'page', image_size: 'square'
end