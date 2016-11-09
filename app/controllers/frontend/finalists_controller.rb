class Frontend::FinalistsController < ApplicationController
  add_breadcrumb "home", :root_path, :options => { :title => "Home" }
  add_breadcrumb "finalists", :frontend_finalists_path
  layout proc{|controller| controller.request.xhr? ? false : 'sidebar_layout'}

  def index
    add_breadcrumb 'Finalists', frontend_finalists_path
    @finalists = Application.accepted.order("updated_at DESC")
  end

  def finalist
    add_breadcrumb 'Finalists', frontend_finalists_path
    @finalists = Application.accepted.order("updated_at DESC")
    @title = "Finalists"
    render :index
  end

 def show
  @finalist = Application.accepted.find(params[:id])
  respond_to do |format|
    format.js
  end
end


end
