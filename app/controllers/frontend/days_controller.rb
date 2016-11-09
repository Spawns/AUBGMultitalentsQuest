class Frontend::DaysController < ApplicationController


layout 'sidebar_layout'

 
  def index
    @days = Day.all.order('number')
    add_breadcrumb "Home" , :root_path
    add_breadcrumb 'Agenda', frontend_agenda_path , :options => { :title => 'Agenda'}
  end



end
