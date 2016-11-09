class Admin::ApplicationsController < ApplicationController


  before_action :authenticate_admin!
  layout 'configuration'
  layout  proc {|controller| controller.request.xhr? ? false: 'configuration'}

  def index
    case params[:type]
      when 'submitted'
        @applications = Application.submitted.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
      when 'incomplete'
        @applications = Application.incomplete.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
      when 'accepted'
        @applications = Application.accepted.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
      when 'denied'
        @applications = Application.denied.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
      else
        @applications = Application.submitted.paginate(page: params[:page], :per_page => 10).order('created_at DESC')
    end
  end


  def accept
    @application = Application.find(params[:id])
    @application.accept
    redirect_to admin_applications_path
  end

  def deny
    @application = Application.find(params[:id])
    @application.deny
    redirect_to admin_applications_path
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def show
    @application = Application.find(params[:id])
  end

  def destroy

  end



end