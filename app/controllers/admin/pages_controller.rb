class Admin::PagesController < Admin::ApplicationController

  before_action :authenticate_admin!
  layout 'configuration'

  def create

    @page = Page.new(page_params)
    @page.save

    redirect_to edit_admin_page_path(@page)
  end

  def edit
    @page = Page.find(params[:id])

  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      redirect_to :back
    else
      render :edit
    end

  end

  private

  def page_params
    params.require(:page).permit(:title , :content, :content1)
  end

end