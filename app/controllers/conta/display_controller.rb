class Conta::DisplayController < ApplicationController
  layout 'files_panel'

  def index
    @cod_barra = params[:format]
  end
end
