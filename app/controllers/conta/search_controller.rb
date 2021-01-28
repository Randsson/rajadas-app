class Conta::SearchController < ApplicationController
  include ApplicationHelper
  layout 'files_panel'
  before_action :set_arquivo, only: %i[index]
  before_action :set_valor_total, only: %i[index]
  # before_action :set_campos_barra, only: %i[index]
  # before_action :set_campos_cod_barra, only: %i[index]
  before_action :set_tamanho_barra, only: %i[index]
 
  def index
    
  end

  private

  def set_arquivo
    @arquivo = Arquivo.find(params[:id])
  end

  def set_valor_total
    @valor_total = valor_total_arquivo(@arquivo)
  end

  def set_campos_barra
    @campos = cod_rajada_campos
  end

  def set_campos_cod_barra
    @campos_cod_barra = cod_barra_campos
  end

  def set_tamanho_barra
    @tamanho_barra = extrair_cod_barra(@arquivo.documento.first)
  end
end
