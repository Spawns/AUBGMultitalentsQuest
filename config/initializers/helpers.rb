Rails.application.assets.context_class.class_eval do
  include ActionView::Helpers
  include AppConfigsHelper
  include Rails.application.routes.url_helpers
end