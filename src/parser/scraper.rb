require 'json'
require 'nokogiri'
require 'httparty'

def parse_curso
  require '../api/models/curso'
  require '../api/serializers/curso'
  # id de cursos para requisicao
  # ['1813968', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1813986'],
  #  ['1626707', ],
  id_cursos = [['1626669', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/940'],
               ['1626865', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/5011473'], 
               ['1626769', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/906'],
               ['1626776', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4023177'],
               ['1626755', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1013'],
               ['1626780', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/6324549'],
               ['1626810', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1813990'],
               ['1626770', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1626900'],
               ['1626754', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/961'], 
               ['1626862', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1047'],
               ['1626786', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2537201'],
               ['1626789', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2550936'],
               ['1626836', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/984'],
               ['1626787', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2549023'],
               ['1813967', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1813982'],
               ['1626874', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/720'],
               ['1626790', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/948'],
               ['1626838', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2549764'],
               ['1626785', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/956'],
               ['1626793', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/953'],
               ['1626837', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1040'],
               ['2663771', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1022'],
               ['1626645', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2589151'],
               ['1626663', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/962'],
               ['1626729', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/3976615'],
               ['1626867', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2570224'],
               ['1626815', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/978'],
               ['1626733', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1012'],
               ['1626646', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4008665'],
               ['1626813', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/980'],
               ['1626855', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/7301331'],
               ['5505677', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2588919'],
               ['1626868', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1924738'],
               ['1626675', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/755'],
               ['4028601', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/5452939'],
               ['1626651', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4022635'],
               ['1626681', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1008'],
               ['1626799', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/972'],
               ['1626869', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/727'],
               ['1626827', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1036'],
               ['1626711', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/813'],
               ['1626832', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2575070'],
               ['2663764', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1760536'],
               ['1626872', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2732786'],
               ['2663753', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/3978448'],
               ['4057805', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2742180'],
               ['2663739', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2578082'],
               ['2663749', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2923405'],
               ['1626814', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/6715181'],
               ['1626724', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2679966'],
               ['1626882', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/6484349'],
               ['1626816', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4019316'],
               ['1626764', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/936'],
               ['1626662', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1046'],
               ['1626648', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2550831'],
               ['1626758', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2051553'],
               ['1626877', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2549491'],
               ['1626727', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/974'],
               ['1626880', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/723'],
               ['1626795', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/941'],
               ['1626692', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2558867'],
               ['1626802', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1026'],
               ['1626693', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/966'],
               ['1626665', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/741'],
               ['1626694', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4018416'], 
               ['1626696', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/737'],
               ['1626826', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1037'],
               ['5766890', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/5786415'],
               ['1626850', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1033'],
               ['1626843', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1813989'],
               ['1626656', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/876'],
               ['1626772', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2701355'],
               ['2291377', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2291381'],
               ['1626775', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4139883'],
               ['1626778', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2727661'],
               ['2675573', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2707187'],
               ['1626881', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1030'],
               ['1626774', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1626905'],
               ['1626823', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1031'],
               ['1626773', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/6226323'],
               ['2663765', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2375635'],
               ['1626842', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2375634'],
               ['1626743', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/744'],
               ['1626768', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/905'],
               ['1626848', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1017'],
               ['1626698', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1011'],
               ['2699762', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/982'],
               ['1626845', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1813987'],
               ['2663759', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/970'],
               ['1626818', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1039'],
               ['1626777', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1626908'],
               ['1626808', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/4434509'],
               ['1626736', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1779916'],
               ['1626738', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/939'],
               ['1626740', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1029'],
               ['1626809', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2552427'],
               ['1626849', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2554783'],
               ['1626741', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/861'],
               ['1626866', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1004'],
               ['1626804', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/2552793'],
               ['1626647', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1626906'],
               ['1976359', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1976364'],
               ['1626859', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1044'],
               ['1626861', 'https://sigaa.ufpb.br/sigaa/link/public/curso/curriculo/1045']]
  cursos = Array.new
  
  id_cursos.each do |id|
    # pega o html
    url = 'http://sistemas.ufpb.br/sigaa/public/curso/portal.jsf?id=%s&lc=pt_BR' % id[0]
    parse_page = Nokogiri::HTML(HTTParty.get(url), nil, Encoding::UTF_8.to_s)
  
    # procura elementos no html
    nome = parse_page.css('div#colDirTop h1').text.strip
    nivel = parse_page.css('div#colDirTop h2').text.strip.lines.last.strip
    centro =  parse_page.css('div#colDirTop a').text.strip
    modalidade = parse_page.css('dd').last.text.strip
    disciplinas = parse_disciplina(id[1])
    
    cursos.push(Curso.new(id[0], nome, nivel, centro, modalidade, disciplinas))
  end
  # parser para arquivo json
  File.open('../../db/data/cursos.json', 'a') do |f|
    f.puts '['
    cursos.each do |c|
      f.puts CursoSerializer.new(c).as_json.to_json
      f.puts ',' if not c.equal?(cursos.last)
    end
    f.puts ']'
  end
end

def parse_centro
  require '../api/models/centro'
  require '../api/serializers/centro'

  centros = Array.new
  centros.push(Centro.new('1', 'CBIOTEC - CENTRO DE BIOTECNOLOGIA (CBIOTEC)', ['1626776'], ['1863', '1862', '1864']))
  centros.push(Centro.new('2', 'CCA - CENTRO DE CIÊNCIAS AGRÁRIAS (CCA)', ['1626755', '1626780', '1626810', '1626770','1626754'], ['1624', '1471', '1625', '1469', '3197', '1468', '1470']))
  centros.push(Centro.new('3', 'CCAE - CENTRO DE CIÊNCIAS APLICADAS E EDUCAÇÃO (CCAE)', ['1626862', '1626786', '1626789', '1626836', '1626787', '1813967', '1626874', '1626790', '1626838', '1626785', '1626793', '1626837'], ['1637', '1634', '1766', '1865', '1635', '1636', '1866', '1764']))
  centros.push(Centro.new('4', 'CCS - CENTRO DE CIÊNCIAS DA SAÚDE (CCS)', ['2663771', '1626645', '1626663', '1626729', '1626867', '1626815', '1626732', '1626733', '1626646', '1626813'], ['1364', '1359', '1369', '1371', '1372', '1365', '1370', '1608', '1366', '1368', '1360', '1629']))
  centros.push(Centro.new('5', 'CCEN - CENTRO DE CIÊNCIAS EXATAS E DA NATUREZA (CCEN)', ['1626855','5505677', '1626868', '1626675', '4028601', '1626651', '1626681', '1626799'], ['1339', '1341', '1335', '1336', '1337', '1338', '1342']))
  centros.push(Centro.new('6', 'CCHLA - CENTRO DE CIÊNCIAS HUMANAS, LETRAS E ARTES (CCHLA)', ['1626869','1626827', '1626711', '1626832', '2663764', '1626872', '2663753', '4057805', '2663739', '2663749', '1626814', '1626724', '1626882', '1626816'], ['1347', '1348', '1354', '1349', '1350', '3081', '1627', '1351', '1353']))
  centros.push(Centro.new('7', 'CCHSA - CENTRO DE CIÊNCIAS HUMANAS SOCIAIS E AGRÁRIAS (CCHSA)', ['1626764', '1626662', '1626648','1626758', '1626752', '1626877'], ['2876', '2877', '1475', '1609', '1767', '1623']))
  centros.push(Centro.new('8', 'CCJ - CENTRO DE CIÊNCIAS JURÍDICAS (CCJ)', ['1626727', '1626880'], ['1578', '1391', '1566', '1390']))
  centros.push(Centro.new('9', 'CCM - CENTRO DE CIENCIAS MEDICAS (CCM)', ['1626795'], ['1617', '1616', '1618', '1619', '1620']))
  centros.push(Centro.new('10', 'CCSA - CENTRO DE CIÊNCIAS SOCIAIS E APLICADAS (CCSA)', ['1626692', '1626802', '1626693', '1626665', '1626694', '1626696', '1626826', '5766890', '1626850'], ['1330', '1331', '1329', '1332', '1603', '1612']))
  centros.push(Centro.new('11', 'CCTA - CENTRO DE COMUNICAÇÃO, TURISMO E ARTES (CCTA)', ['1626843','1626772', '1626656', '1813968', '1626707', '2291377', '1626775', '1626778', '2675573','1626881', '1626774', '1626823', '1626773', '2663765', '1626842', '1626743'], ['2612', '2608', '2384', '2607', '3136', '2605', '2834']))
  centros.push(Centro.new('12', 'CE - CENTRO DE EDUCAÇÃO (CE)', ['1626768','1626848', '1626698', '2699762', '1626845', '2663759', '1626818'], ['1622', '2883', '1387', '1386', '1385', '1630', '1628']))
  centros.push(Centro.new('13', 'CEAR - CENTRO DE ENERGIAS E ALTERNATIVAS E RENOVÁVEIS (CEAR)', ['1626777', '1626808'], ['1855', '2616']))
  centros.push(Centro.new('14', 'CI - CENTRO DE INFORMÁTICA (CI)', ['1626669', '1626865', '1626769'], ['1859', '2151', '1858']))
  centros.push(Centro.new('15', 'CT - CENTRO DE TECNOLOGIA (CT)', ['1626736', '1626738', '1626740', '1626809', '1626849', '1626741', '1626866', '1626804','1626647'], ['1379', '1583', '1779', '1575', '1380', '1377', '1610']))
  centros.push(Centro.new('16', 'CTDR - CENTRO DE TECNOLOGIA E DESENVOLVIMENTO REGIONAL (CTDR)', ['1976359', '1626859', '1626861'], ['2840', '2159', '1602']))

  # parser para arquivo json
  File.open('../../db/data/centros.json', 'w') do |f|
    f.puts '['
    centros.each do |c|
      f.puts CentroSerializer.new(c).as_json.to_json
      f.puts ',' if not c.equal?(centros.last)
    end
    f.puts ']'
  end
end

def parse_disciplina(url)
  require '../api/models/disciplina'

  parse_page = Nokogiri::HTML(HTTParty.get(url), nil, Encoding::UTF_8.to_s)
  # array de disciplinas do curso
  disciplinas = Array.new

  parse_page.css('table tr.componentes').each do |disciplina|
    arr = disciplina.css('td')[0].text.strip.split('-')

    id = arr[0].strip
    nome = arr[1].strip
    natureza = disciplina.css('td')[1].text.strip
    creditos = arr[2].strip
    carga_horaria = arr[3].strip
  
    disciplinas.push(Disciplina.new(id, nome, natureza, creditos, carga_horaria))
  end
  disciplinas
end

def parse_unidade
  parse_page = Nokogiri::HTML(HTTParty.get(url), nil, Encoding::UTF_8.to_s)
  #puts parse_page.css('form').css('select#form\\:unidades').text.strip
end

# chamada dos parsers
# ALTERAR DE 'w' para 'a' <=> parse_curso
parse_centro
# parse_curso
