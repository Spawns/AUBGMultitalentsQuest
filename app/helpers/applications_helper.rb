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
   current_user.application.check_attributes && current_user.application.uploader.check_attributes
  end

   def check_for_incomplete
    if application_check then true else false end
   end
  
end
