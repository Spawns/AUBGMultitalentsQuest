Yt.configure do |config|
  config.api_key = ENV['YT_API_KEY']
  config.client_id = ENV['YT_API_CLIENT_ID']
  config.client_secret = ENV['YT_API_SECRET']
end