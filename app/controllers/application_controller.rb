class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  helper_method :yt_client

  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:username => ENV['GMAIL_USERNAME'] , :password => ENV['GMAIL_PASSWORD'], :dev_key => ENV['YT_API_KEY'])
  end

end
