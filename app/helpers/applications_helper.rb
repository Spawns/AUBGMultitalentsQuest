module ApplicationsHelper
  def application_complete?
    case true
      when current_user.application.status == ("submitted" || "accepted" || "denied")
        content_tag(:a  , :class=>'success-status',:href=> '#') {
          content_tag(:span, "Submitted  ") +
          content_tag(:i , :class=> 'fi-check'){}}
      when check_for_incomplete
        content_tag(:a, :class=>'submit-status', :href => application_process_show_status_path ) {
          content_tag(:span, "Submit now  ") +
          content_tag(:i , :class=> 'fi-upload'){}
        }
      else
        content_tag(:a , :class=>'incomplete-status', :href=> application_process_show_status_path) {
          content_tag(:span, "Incomplete  ") +
          content_tag(:i , :class=> 'fi-x'){}
        }
    end
  end

  def check_input(attribute)
   if !attribute.nil? || !attribute.blank?
     attribute
   else
     content_tag(:span , :class => "missing") { 'MISSING' }
   end
  end

  def application_check
   current_user.application.check_attributes
  end

   def check_for_incomplete
    if application_check then true else false end
   end

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
