class CentroSerializer
  def initialize(centro)
    @centro = centro
  end

  def as_json
    data = {
      "id": @centro.id,
      "nome": @centro.nome,
      "cursos": @centro.cursos,
      "departamentos": @centro.departamentos
    }
    data
  end
end