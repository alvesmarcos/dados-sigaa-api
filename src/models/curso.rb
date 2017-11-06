class Curso
  def initialize(id='', nome='', nivel='', departamento='', coordenacao_do_curso='',
                vice_coordenacao_do_curso='', modalidade='')
    @id = id
    @nome = nome
    @nivel = nivel
    @departamento = departamento
    @coordenacao_do_curso = coordenacao_do_curso
    @vice_coordenacao_do_curso = vice_coordenacao_do_curso
    @modalidade = modalidade
  end
end