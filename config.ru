require 'sinatra'
require './controllers/posts'

configure do
  # Since we can only use GET & POST in HTML, but
  # would like to use the full range of HTTP verbs,
  # set the :method_override option to true.
  #
  # What this does:
  # Look for params named _method, with possible
  # values of (put|patch|delete)
  # and "re-write" the verb of the request to
  # match _method.
  set :method_override, true
end

run Sinatra::Application
