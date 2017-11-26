class Disciplina
  attr_accessor :id, :nome, :natureza, :creditos, :carga_horaria

  def initialize(id='', nome='', natureza='', creditos='', carga_horaria='')
    @id = id
    @nome = nome
    @natureza = natureza
    @creditos = creditos
    @carga_horaria = carga_horaria    
  end
end