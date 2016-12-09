class Frontend::PartnersController < ApplicationController
 add_breadcrumb "home", :root_path, :options => { :title => "Home" }
   def index
     add_breadcrumb 'Sponsors', frontend_partners_path , :options => { :title => 'Sponsors'}
     @partners_corporate = Partner.where("role='corporate'")
     @partners_individual = Partner.where("role='individual'")
   end

end
