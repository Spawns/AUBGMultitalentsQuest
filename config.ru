# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/rewrite'
use Rack::Rewrite do
  rewrite   '/',  'aubgquest.herokuapp.com/'
  r301      '/',   'aubgquest.herokuapp.com/'
end