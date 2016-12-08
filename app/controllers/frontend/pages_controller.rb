class Frontend::PagesController < ApplicationController
  layout 'sidebar_layout'

    def rules
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "round1", :frontend_rules_path, :options => { :title => "Rules for Round 1" }
      @page = Page.where(title: 'rules').first
    end

    def rules1
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "round2", :frontend_rules_path, :options => { :title => "Rules for Round 2" }
      @page = Page.where(title: 'rules').first
    end

    def accommodation
      add_breadcrumb "home", :root_path, :options => { :title => "Home" }
      add_breadcrumb "accommodation", :frontend_accommodation_path, :options => { :title => "Accommodation" }
      @page = Page.where(title: 'accommodation').first
    end

end