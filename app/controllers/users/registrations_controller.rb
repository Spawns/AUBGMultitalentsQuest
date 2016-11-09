class Users::RegistrationsController < Devise::RegistrationsController
before_filter :app_process_closed?

add_breadcrumb "Home" , :root_path

  def new
    add_breadcrumb "Apply" , :new_user_registration_path
    super
  end
  protected
  def after_sign_up_path_for(resource)
    application_process_create_application_path
  end
  private

  def app_process_closed?
    unless AppConfig.applications_open?
      redirect_to frontend_process_closed_path
    end
  end

end