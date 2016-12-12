# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment',  __FILE__)


map LiberalArts::Application.config.relative_url_root || "/" do
  run Rails.application
end

require 'rack/rewrite'
use Rack::Rewrite do
  rewrite   '/',  '/aubgquest1'
  r301      '/',   '/aubgquest1'
end