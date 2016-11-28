class Uploader < ActiveRecord::Base
  belongs_to :application
  before_save :default_values
  validates :title, :description, :yt_video_id, :presence => true, :on => :update,  :if => :active_or_uploader?

  def active?
    status == 'incomplete'
  end
  def active_or_uploader?
    status.include?('uploader') || active?
  end

  def check_attributes
    self.attributes.each do |attr_name , attr_value|
      if attr_value.blank? || attr_value.nil?
        return false
      end
    end
  end

  def default_values
    self.status ||= "incomplete"
  end

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