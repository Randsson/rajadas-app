class Conta::SearchController < ApplicationController
  layout 'files_panel'
  before_action :set_arquivo, only: %i[index]
  
  def index
    @filtro = params[:filtro]
  end

  private
  
  def set_arquivo
    @arquivo = Arquivo.find(params[:format])
  end
end
