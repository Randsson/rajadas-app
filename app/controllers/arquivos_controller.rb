class ArquivosController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper
  layout 'files_panel'

  respond_to :html, :pdf

  before_action :set_arquivo, only: %i[show edit update destroy]
  before_action :set_valor_total, only: %i[show]
  # before_action :set_campos_barra, only: %i[show]
  before_action :set_tamanho_barra, only: %i[show]

  # GET /arquivos
  # GET /arquivos.json
  def index
    @arquivos = Arquivo.all
  end

  # GET /arquivos/1
  # GET /arquivos/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Tabela do Arquivo: #{@arquivo.id}",
               page_size: 'A4',
               template: "arquivos/_show_barras.html.erb",
               layout: 'pdf.html',
               lowquality: true,
               zoom: 1,
               dpi: 75,
               margin: { top: 30, bottom: 30, left: 10, right: 10 }
               #header:  {   html: {  template: 'views/layouts/header'} } 
      end
    end
  end

  # GET /arquivos/new
  def new
    @arquivo = Arquivo.new
  end

  # GET /arquivos/1/edit
  def edit; end

  # POST /arquivos
  # POST /arquivos.json
  def create
    @arquivo = Arquivo.new(arquivo_params)

    respond_to do |format|
      if @arquivo.save
        format.html { redirect_to @arquivo, notice: 'Arquivo criado com sucesso' }
        format.json { render :show, status: :created, location: @arquivo }
      else
        format.html { render :new }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arquivos/1
  # PATCH/PUT /arquivos/1.json
  def update
    respond_to do |format|
      if @arquivo.update(arquivo_params)
        format.html { redirect_to @arquivo, notice: 'Arquivo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @arquivo }
      else
        format.html { render :edit }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arquivos/1
  # DELETE /arquivos/1.json
  def destroy
    @arquivo.destroy
    respond_to do |format|
      format.html { redirect_to arquivos_url, notice: 'Arquivo excluído com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_arquivo
    @arquivo = Arquivo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def arquivo_params
    params.require(:arquivo).permit(:title, :body, documento: [])
  end

  def set_valor_total
    @valor_total = valor_total_arquivo(@arquivo)
  end

  # def set_campos_barra
  #   @campos = cod_barra_campos
  # end

  def set_tamanho_barra
    @tamanho_barra = extrair_cod_barra(@arquivo.documento.first)
  end
end
