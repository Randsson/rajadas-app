class Conta::DisplayController < ApplicationController
  layout 'files_panel'
  # before_action :set_arquivo, only: %w[index]

  def index
    @cod_leitura = params[:format]
    @formas_pagamentos = { '1' => 'Dinheiro', '2' => 'Cheque', '3' => 'Nao identificado' }
    canais_de_recebimento
  end

  private

  def set_arquivo
    @arquivo = params[:id]
  end

  def canais_de_recebimento
    @canais_de_recebimento = {
      '1' => 'Guichê de Caixa com fatura/guia de arrecadação',
      '2' => 'Arrecadação Eletrônica com fatura/guia de arrecadação (terminais de auto - atendimento, ATM, home/office banking)',
      '3' => 'Internet com fatura/guia de arrecadação',
      '4' => 'Outros meios com fatura/guia de arrecadação',
      '5' => 'Casas lotéricas/correspondentes bancários com fatura/guia de arrecadação',
      '6' => 'Telefone com fatura/guia de arrecadação'
    }
  end
end
