module ApplicationHelper
  def extrair_path_arquivo(arquivo)
    arquivo.documento.reduce([]) do |paths, doc|
      paths << ActiveStorage::Blob.service.path_for(doc.key)
    end
  end

  def extrair_cod_barra(arquivo)
    path = ActiveStorage::Blob.service.path_for(arquivo.key)
    doc = File.readlines(path)
    doc[1...-1]
  end

  def extrair_cod_barra_avulso(arquivo)
    path = ActiveStorage::Blob.service.path_for(arquivo.key)
    File.readlines(path)
  end

  def verifica_duplicadas(arquivo)
    arquivo.group_by { |e| e }.select { |_k, v| v.size > 1 }.keys
  end

  def valor_total_arquivo(arquivo)
    paths = extrair_path_arquivo(arquivo)

    paths.reduce([]) do |valores, path|
      doc = File.readlines(path)
      valores << doc[-1][7..23]
    end
  end

  def number_to_currency_br(number)
    number_to_currency(number, unit: 'R$ ', separator: ',', delimiter: '.')
  end

  def extrair_cod_barra_filtrado(arquivo, termo, filtro)
    path = ActiveStorage::Blob.service.path_for(arquivo.key)
    doc = File.readlines(path)
    barra_filtrada = []

    doc.each do |line|
      case filtro # 1: NSR, 2: Tipo documento, 3: cod. localidade, 4: Forma arrecadacao
      when /[1\s]/ then barra_filtrada << line
      when '2' then  barra_filtrada << line if line[80].match(termo)
      when '3' then  barra_filtrada << line if line[37..39].match(termo)
      when '4' then  barra_filtrada << line if line[116].match(termo)
      when '5' then barra_filtrada << line if line[100..107].match(termo)
      when '6' then barra_filtrada << line if datas_invalidas(line)
      end
    end
    barra_filtrada
  end

  def datas_invalidas(line)
    line unless line[30..38].match(/\d{2}20\d{2}/)
  end

  def cod_rajada_campos
    campos = [
      ['Todos...', 1],
      ['Tipo do documento', 2],
      ['Código da Localidade', 3],
      ['Forma de Arrecadação', 4],
      ['NSR', 5],
      ['Data Inválida', 6]
    ]
  end

  def cod_barra_campos
    campos = [
      ['Todos...', 1],
      ['Código da Localidade', 3],
      ['Data Inválida', 6]
    ]
  end
end
