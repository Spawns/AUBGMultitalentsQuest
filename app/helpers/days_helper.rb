module DaysHelper

  def add_new_event( f, association)
    new_object = @day.events.build
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render partial: "event_fields", locals: { builder: builder }
    end
    link_to "New Event", "", onclick: "add_fields(this, \"#{association}\" , \"#{escape_javascript(fields)}\" ) ; return false ;" , :class => "add-event-link button secondary small"
  end
end
