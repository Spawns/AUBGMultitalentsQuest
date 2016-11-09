class Admin::AppConfigsController < Admin::ApplicationController


  before_action :authenticate_admin!
  layout 'configuration'



   def new
    if AppConfig.single_entry
     redirect_to edit_admin_app_config_path(1)
    else 
      @app_config = AppConfig.new
    end
   end



   def create
     @app_config = AppConfig.new(appconfig_params)
     if @app_config.save
      redirect_to edit_admin_app_config_path(1)
     else 
      render :new
     end
   end

   def edit
     @app_config = AppConfig.first
   end

   def edit_app_process
    @app_config = AppConfig.first
   end
  #toggle the application process
  def toggle_process
    #verifies the password only of the FIRST admin account
    if Admin.first.valid_password?(params[:admin_password])
      if AppConfig.applications_open?
        AppConfig.stop_process
      else
        AppConfig.start_process
      end
      flash[:notice] = "Process successfully changed."
      redirect_to admin_app_config_edit_app_process_path(1)
    else
      flash[:notice] = "Incorrect password supplied."
      redirect_to admin_app_config_edit_app_process_path(1)
    end
  end
  #delete all the applications (should be used at the end of each year)
  def reset_process
    #verifies the password only of the FIRST admin account
    if Admin.first.valid_password?(params[:admin_password])
      Application.destroy_all
      flash[:notice] = "All user applications have been deleted."
      redirect_to admin_app_config_edit_app_process_path(1)
    else
      flash[:notice] = "Incorrect password supplied."
      redirect_to admin_app_config_edit_app_process_path(1)
    end
  end

   def update

     if  AppConfig.first.update_attributes(appconfig_params)
      redirect_to :back
     else
      render :edit
     end


  end

  private

   def appconfig_params
    params.require(:app_config).permit(:keywords , :description , :tw_url , :yt_url , :fb_url , :conf_start , :conf_end  , :tos)
   end


end
