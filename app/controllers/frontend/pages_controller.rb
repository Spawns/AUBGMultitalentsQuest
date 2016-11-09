class Frontend::PagesController < ApplicationController
  layout 'sidebar_layout'

    def rules
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "rules", :frontend_rules_path, :options => { :title => "Rules Information" }
      @page = Page.where(title: 'rules').first
    end

    def accommodation
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "accommodation", :frontend_accommodation_path, :options => { :title => "Accommodation" }
      @page = Page.where(title: 'accommodation').first
    end

end