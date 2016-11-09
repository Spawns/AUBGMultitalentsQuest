class Admin::DaysController < Admin::ApplicationController
  before_action :authenticate_admin!
  layout 'configuration'
  before_filter :set_day , only: [:edit , :update , :destroy]
  before_filter :all_days, only: [:index , :create, :update , :destroy]
  layout  proc {|controller| controller.request.xhr? ? false: 'configuration'}

  def index

  end

  def new
    @day = Day.new

    respond_to do |format|
      format.js
    end

  end

  def create
    @day = Day.new(day_params)

    respond_to do |format|
      if @day.save

        format.js
      else
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @day.update_attributes(day_params)
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @day.destroy

    respond_to do |format|
      format.js
    end
  end


  private

  def set_day
    @day = Day.find(params[:id])
  end

  def all_days
    @days = Day.all.order('number')
  end

  def day_params
    params.require(:day).permit( :number , :day_date , events_attributes: [:title , :description , :start , :stop , :place])

  end

end