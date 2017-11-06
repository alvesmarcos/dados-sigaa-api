require 'json'
require 'nokogiri'
require 'httparty'

def parse_curso
  require '../api/models/curso'
  require '../api/serializers/curso'
  # id de cursos para requisicao
  id_cursos = ['1626669', '1626865', '1626769', '1626776', '1626755', '1626780', '1626810', '1626770',
              '1626754', '1626862', '1626786', '1626789', '1626836', '1626787', '1813967', '1626874',
              '1626790', '1626838', '1626785', '1626793', '1626837', '2663771', '1626645', '1626663',
              '1626729', '1626867', '1626815', '1626732', '1626733', '1626646', '1626813', '1626855',
              '5505677', '1626868', '1626675', '4028601', '1626651', '1626681', '1626799', '1626869',
              '1626827', '1626711', '1626832', '2663764', '1626872', '2663753', '4057805', '2663739',
              '2663749', '1626814', '1626724', '1626882', '1626816', '1626764', '1626662', '1626648',
              '1626758', '1626752', '1626877', '1626727', '1626880', '1626795', '1626692', '1626802',
              '1626693', '1626665', '1626694', '1626696', '1626826', '5766890', '1626850', '1626843',
              '1626772', '1626656', '1813968', '1626707', '2291377', '1626775', '1626778', '2675573',
              '1626881', '1626774', '1626823', '1626773', '2663765', '1626842', '1626743', '1626768',
              '1626848', '1626698', '2699762', '1626845', '2663759', '1626818', '1626777', '1626808',
              '1626736', '1626738', '1626740', '1626809', '1626849', '1626741', '1626866', '1626804',
              '1626647', '1976359', '1626859', '1626861']
  cursos = Array.new
  
  id_cursos.each do |id|
    # pega o html
    url = 'http://sistemas.ufpb.br/sigaa/public/curso/portal.jsf?id=%s&lc=pt_BR' % id
    parse_page = Nokogiri::HTML(HTTParty.get(url), nil, Encoding::UTF_8.to_s)
  
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

# ALTERAR DE 'w' para 'a' <=> parse_curso