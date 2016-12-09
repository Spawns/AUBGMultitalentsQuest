class Admin::PartnersController < Admin::ApplicationController
  layout 'configuration'
  before_action :authenticate_admin!
  before_filter :set_partner, only: [:edit , :update , :destroy]
  before_filter :all_partners , only: [:index , :create, :update , :destroy]

  layout  proc {|controller| controller.request.xhr? ? false: 'configuration'}


  def index
    if params[:corporate_page]
      @active = 'corporate'
    elsif params[:individual_page]
      @active = 'individual'
    else
      @active = 'corporate'
    end
  end

  def new
    @partner = Partner.new

    respond_to do |format|
      format.js
    end
  end

  def create
    @partner = Partner.new(partner_params)

    respond_to do |format|
      if @partner.save
        format.js
      else
        format.js
      end
    end
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @partner.update_attributes(partner_params)
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @partner.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def all_partners
    @corporate_partners = Partner.where("role = :role" ,  role: 'corporate').paginate(page: params[:corporate_page], :per_page => 4).order('created_at DESC')
    @individual_partners = Partner.where("role = :role" ,  role: 'individual').paginate(page: params[:individual_page], :per_page => 4).order('created_at DESC')

  end

  def set_partner
    @partner = Partner.find(params[:id])
  end
  def partner_params
    params.require(:partner).permit(:link, :logo, :name, :role)
  end

end