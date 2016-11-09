class Frontend::ContactFormsController < ApplicationController
  def new
    add_breadcrumb "Home" , :root_path
    add_breadcrumb 'Contact', new_frontend_contact_form_path , :options => { :title => 'Contact'}
    @contact_form = ContactForm.new()
  end


  def create
     begin @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request 
        respond_to do |format|
          if @contact_form.deliver 
           format.js
           else 
           format.js
          end 
          
        end
      rescue ScriptError 
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.' 
    end
  end
end
