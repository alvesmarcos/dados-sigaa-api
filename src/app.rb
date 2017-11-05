require 'sinatra'

# set content type response application
before do
  content_type 'application/json'
end

get '/' do
  { :API => "dados-sigaa-api", :version => '0.0.1' }.to_json
end