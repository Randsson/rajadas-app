module ArquivosHelper
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
end
