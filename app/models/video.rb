class Video < ActiveRecord::Base

  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => ENV['GMAIL_USERNAME'] , :password => ENV['GMAIL_PASSWORD'], :dev_key => ENV['YT_API_KEY'])
  end

  def self.token_form(nexturl)
    yt_session.upload_token(video_options(), nexturl)
  end

  private
    def self.video_options()
      opts = {:title => "asdf",
             :description => "asdf",
             :category => "People",
             :keywords => ["test"],
             :private => "true"}
      opts
    end
end