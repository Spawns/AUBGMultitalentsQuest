class Admins::SessionsController < Devise::SessionsController

  def new
    add_breadcrumb "Home" , :root_path
    add_breadcrumb "Sign in" , :new_admin_session_path
    super
  end

end