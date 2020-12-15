class ArquivosController < ApplicationController
  include ApplicationHelper
  layout 'files_panel'
  before_action :set_arquivo, only: %i[show edit update destroy]
  before_action :set_valor_total, only: %i[show]
  before_action :set_campos_barra, only: %i[show]

  # GET /arquivos
  # GET /arquivos.json
  def index
    @arquivos = Arquivo.all
  end

  # GET /arquivos/1
  # GET /arquivos/1.json
  def show
    # set_agencia
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
  
  def set_campos_barra
    @campos = cod_barra_campos
  end

end
