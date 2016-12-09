module FinalistsHelper
  def parse_video_url(url)
    @url = url
    youtube_formats = [
        %r(https?://youtu\.be/(.+)),
        %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
        %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
        %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
        %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
    ]
    @url.strip!
    if @url.include? "youtu"
      youtube_formats.find { |format| @url =~ format } and $1
      @results = $1
      @results
    else
      return nil
    end
  end
end
