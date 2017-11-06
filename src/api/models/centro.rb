class Centro
  attr_accessor :id, :nome, :cursos
  
  def initialize(id='', nome='', cursos=nil)
    @id = id
    @nome = nome
    @cursos = cursos
  end
end