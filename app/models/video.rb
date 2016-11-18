class Video < ActiveRecord::Base
  acts_as_commentable

  scope :completes,   where(:is_complete => true)
  scope :incompletes, where(:is_complete => false)
    
  def self.yt_session
    @yt_session ||= YouTubeIt::Client.new(:username => ENV['GMAIL_USERNAME'] , :password => ENV['GMAIL_PASSWORD'], :dev_key => ENV['YT_API_KEY'])
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  private
    def self.video_options(params)
      opts = {:title => params[:title],
             :description => params[:description],
             :category => "People",
             :keywords => ["test"]}
      params[:is_unpublished] == "1" ? opts.merge(:private => "true") : opts
    end
end