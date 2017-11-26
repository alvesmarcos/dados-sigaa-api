class Curso
  attr_accessor :id, :nome, :nivel, :centro, :modalidade, :disciplinas

  def initialize(id='', nome='', nivel='', centro='', modalidade='', disciplinas=nil)
    @id = id
    @nome = nome
    @nivel = nivel
    @centro = centro
    @modalidade = modalidade
    @disciplinas = disciplinas
  end
end