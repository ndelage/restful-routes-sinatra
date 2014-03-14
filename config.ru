require 'sinatra'
require './controllers/posts'

configure do
  set :method_override, true
end

run Sinatra::Application
