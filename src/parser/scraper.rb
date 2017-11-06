require 'json'
require 'nokogiri'
require 'open-uri'

def parse_curso
  require '../api/models/curso'
  require '../api/serializers/curso'
  # id de cursos para requisicao
  id_cursos = ['1626669', '1626865', '1626769']
  cursos = Array.new
  
  id_cursos.each do |id|
    # pega o html
    url = 'http://sistemas.ufpb.br/sigaa/public/curso/portal.jsf?id=%s&lc=pt_BR' % id
    parse_page = Nokogiri::HTML(open(url), nil, Encoding::UTF_8.to_s)
  
    # procura elementos no html
    nome = parse_page.css('div#colDirTop h1').text.strip
    nivel = parse_page.css('div#colDirTop h2').text.strip.lines.last.strip
    centro =  parse_page.css('div#colDirTop a').text.strip
    modalidade = parse_page.css('dd').last.text.strip
    
    cursos.push(Curso.new(id, nome, nivel, centro, modalidade))
  end
  # parser para arquivo json
  File.open('../../db/data/cursos.json', 'w') do |f|
    f.puts '['
    cursos.each do |c|
      f.puts CursoSerializer.new(c).as_json.to_json
      f.puts ',' if not c.equal?(cursos.last)
    end
    f.puts ']'
  end
end

parse_curso