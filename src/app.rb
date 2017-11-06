require 'sinatra'
require 'sinatra/contrib'
require './controllers/curso'

# set content type response application
before do
  content_type 'application/json'
end

namespace '/api/v1' do
  # routes cursos
  curso_controller = CursoController.new
  
  get '/cursos' do
    response = curso_controller.index
    body response[:body]
    status response[:status]
  end
  
  get '/cursos/:id' do |id|
    response = curso_controller.show(id)
    body response[:body]
    status response[:status]
  end
end

# root
get '/' do
  response =  { :status => 200, :body => { "API": "dados-sigaa-api", "version": "0.0.1" }.to_json }
  body response[:body]
  status response[:status]
end
