class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  layout 'configuration'
  protect_from_forgery
end
