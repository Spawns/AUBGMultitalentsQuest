Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['YT_API_CLIENT_ID'], ENV['YT_API_SECRET'], scope: 'userinfo.profile,youtube'
end