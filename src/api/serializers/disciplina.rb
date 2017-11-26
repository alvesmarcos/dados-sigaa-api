class DisciplinaSerializer
  def initialize(disciplina)
    @disciplina = disciplina
  end

  def as_json
    data = {
      "id": @disciplina.id,
      "nome": @disciplina.nome,
      "natureza": @disciplina.natureza,
      "creditos": @disciplina.creditos,
      "cargaHoraria": @disciplina.carga_horaria
    }
    data
  end
end