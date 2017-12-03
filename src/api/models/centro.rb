class Centro
  attr_accessor :id, :nome, :cursos, :departamentos
  
  def initialize(id='', nome='', cursos=nil, departamentos=nil)
    @id = id
    @nome = nome
    @cursos = cursos
    @departamentos = departamentos
  end
end