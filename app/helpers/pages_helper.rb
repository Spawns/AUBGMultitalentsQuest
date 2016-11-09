module PagesHelper
   #used for applying an 'active' class to current pages
   def active_el( classname , path )
     current_page?(path)? classname : ''
   end


   def page_config_link(title , icon)
    if Page.where(title: title).exists?
      link_to( raw("<i class='fi-#{icon}'></i><label>#{title.capitalize}</label>") , edit_admin_page_path(Page.where(title: title).first.id) ,  class:"item #{ active?(edit_admin_page_path(Page.where(title: title).first.id))}")
    else
      link_to( raw("<i class='fi-#{icon}'></i><label>#{title.capitalize}</label>") , { :controller => "admin/pages" , :action => "create"  ,  :page => { :title => title } } , method: :post , class:"item #{ active?({ :controller => "admin/pages" , :action => "create"  ,  :page => { :title => title } } )}")
    end
   end
end
