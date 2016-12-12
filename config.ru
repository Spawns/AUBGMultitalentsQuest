# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application

require 'rack/rewrite'
use Rack::Rewrite do
  rewrite   '/',  '/aubgquest1'
  r301      '/',   '/aubgquest1'
  # r301      %r{/(\w+)_\w+},    '/$1'
end