# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/rewrite'
use Rack::Rewrite do
  rewrite   '/',  'https://aubgquest.herokuapp.com/'
  r301      '/',   'https://aubgquest.herokuapp.com/'
end