module ArquivosHelper
  def selecionar_docs(arquivo)
    a = []
    docs = []
      arquivo.documento.each do |doc|
        a << ActiveStorage::Blob.service.path_for(doc.key)
      end
    
    a.each do |file|
      arq = File.readlines(file)
      puts "acessando #{file}..."
      arq[1...-1].each {|line| docs << line }
    end
    "Quantidade de códigos de barra: #{docs.size}"
    #  gerar_arquivo_txt("#{path}", docs)
  end
end

