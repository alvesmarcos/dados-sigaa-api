class Curso
  attr_accessor :id, :nome, :nivel, :centro, :modalidade

  def initialize(id='', nome='', nivel='', centro='', modalidade='')
    @id = id
    @nome = nome
    @nivel = nivel
    @centro = centro
    @modalidade = modalidade
  end
end