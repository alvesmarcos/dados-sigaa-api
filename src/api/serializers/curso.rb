require '../api/serializers/disciplina'

class CursoSerializer
  def initialize(curso)
    @curso = curso
  end

  def as_json
    data = {
      "id": @curso.id,
      "nome": @curso.nome,
      "nivel": @curso.nivel,
      "centro": @curso.centro,
      "modalidade": @curso.modalidade,
      "disciplinas": @curso.disciplinas.map {|d| DisciplinaSerializer.new(d).as_json }
    }
    data
  end
end