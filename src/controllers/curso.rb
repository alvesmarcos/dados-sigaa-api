require 'json'

class CursoController
  def initialize
    @file = IO.read('../db/mockup/cursos.json')
    @arr = JSON.parse(@file)
  end

  def index
    { :status => 200, :body => @arr.to_json }
  end

  def show(id)
    retrieve = @arr.find {|curso| curso["id"] == id}
    if retrieve == nil
      { :status => 404, :body => {:message => "Curso não encontrado" }.to_json }
    else
      { :status => 200, :body => retrieve.to_json }
    end
  end
end