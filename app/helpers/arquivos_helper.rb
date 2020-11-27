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
      arq[1...-1].each { |line| docs << line }
    end
    docs
  end

  def buscar_cod_barra(arquivo, matricula)
    a = []
    doc = []
    arquivo.documento.each do |doc|
      a << ActiveStorage::Blob.service.path_for(doc.key)
    end

    a.each do |file|
      arq = File.readlines(file)
      puts "acessando #{file}..."
      arq[1...-1].each { |line| doc << line if line[59..67].match matricula }
    end
    "achei #{doc.size}:\n #{doc}"
  end

  def extrair_cod_barra(doc)
    puts "acessando documento #{doc}..."
    @barras = []
    arq = ActiveStorage::Blob.service.path_for(doc.key)
    file = File.readlines(arq)
    file[1...-1].each { |line| @barras << line.strip }
    @barras
  end
  
end
