module ApplicationHelper

  def breadcrumbs_partial
    render 'frontend/shared/breadcrumbs' unless current_page?(root_url) || controller.class.name.split("::").first=="ApplicationProcess"
  end


  def errors(obj)
    obj.errors.full_messages.to_sentence
  end

  def active?(page_url)
    current_page?(page_url) ? 'active' : nil
  end

end