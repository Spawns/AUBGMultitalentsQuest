class Frontend::PartnersController < ApplicationController
 add_breadcrumb "home", :root_path, :options => { :title => "Home" }
   def index
     add_breadcrumb 'Sponsors', frontend_partners_path , :options => { :title => 'Sponsors'}
     @partners_general = Partner.order("updated_at DESC")
   end

end
