class CodigosController < ApplicationController
  layout 'files_panel'
  before_action :set_codigo, only: [:show, :edit, :update, :destroy]

  # GET /codigos
  # GET /codigos.json
  def index
    @codigos = Codigo.all
  end

  # GET /codigos/1
  # GET /codigos/1.json
  def show
  end

  # GET /codigos/new
  def new
    @codigo = Codigo.new
  end

  # GET /codigos/1/edit
  def edit
  end

  # POST /codigos
  # POST /codigos.json
  def create
    code = codigo_params['codigo']
    @codigo = Codigo.new(
      codigo: code.size == 44 ? code : reduzir_codigo(code)
    )

    respond_to do |format|
      if @codigo.save
        format.html { redirect_to codigos_path, notice: 'Código inserido com sucesso.' }
        format.json { render :show, status: :created, location: @codigo }
      else
        format.html { render :new }
        format.json { render json: @codigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codigos/1
  # PATCH/PUT /codigos/1.json
  def update
    respond_to do |format|
      if @codigo.update(codigo_params)
        format.html { redirect_to codigos_path, notice: 'Código atualizado.' }
        format.json { render :show, status: :ok, location: @codigo }
      else
        format.html { render :edit }
        format.json { render json: @codigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codigos/1
  # DELETE /codigos/1.json
  def destroy
    @codigo.destroy
    respond_to do |format|
      format.html { redirect_to codigos_url, notice: 'Codigo foi excluído.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codigo
      @codigo = Codigo.find(params[:id])
    end

    def reduzir_codigo(codigo)
      [].join << codigo[0..10] << codigo[12..22] << codigo[24..34] << codigo[36..46]
    end
    
    # Only allow a list of trusted parameters through.
    def codigo_params
      params.require(:codigo).permit(:codigo)
    end
end
