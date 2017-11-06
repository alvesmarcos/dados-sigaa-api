require 'json'

class CentroController
  def initialize
    @file = IO.read('../../db/data/centros.json')
    @arr = JSON.parse(@file)
  end

  def index
    { :status => 200, :body => @arr.to_json }
  end

  def show(id)
    retrieve = @arr.find {|centro| centro["id"] == id}
    if retrieve == nil
      { :status => 404, :body => {:message => "Centro não encontrado" }.to_json }
    else
      { :status => 200, :body => retrieve.to_json }
    end
  end
end