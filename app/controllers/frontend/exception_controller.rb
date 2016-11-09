class Frontend::ExceptionController < ApplicationController

  def process_closed
    unless !AppConfig.applications_open?
      redirect_to root_path
    end
  end
end