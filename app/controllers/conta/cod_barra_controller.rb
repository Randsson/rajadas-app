class Conta::CodBarraController < ApplicationController
  layout 'files_panel'
  # before_action :set_arquivo, only: %w[index]

  def index
    @cod_leitura = params[:cod_leitura]
    @formas_pagamentos = { '1' => 'Dinheiro', '2' => 'Cheque', '3' => 'Nao identificado' }
    canais_de_recebimento
    localidades

    if params[:format] == 'pdf'
      render pdf: 'Detalhes do Código de Barra',
             page_size: 'A4',
             template: 'conta/cod_barra/index_pdf.html.erb',
             layout: 'pdf_cod_barra.html',
             lowquality: true,
             zoom: 1,
             dpi: 75,
             margin: { top: 10, bottom: 20, left: 10, right: 10 },
             locals: { cod_leitura: @cod_leitura }
      # header:  {   html: {  template: 'views/layouts/header'} }
    end
  end

  private

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

  def localidades
    @localidades = {
      # Unidade sertão
      '001' => 'Água Branca',
      '016' => 'Canapi',
      '025' => 'Delmiro Gouveia',
      '031' => 'Pariconha',
      '036' => 'Inhapi',
      '054' => 'Mata Grande',
      '062' => 'Olho D\'água do Casado',
      '076' => 'Piranhas',
      # Unidade Bacia Leiteira
      '007' => 'Batalha',
      '009' => 'Belo Monte',
      '012' => 'Cacimbinhas',
      '018' => 'Carneiros',
      '026' => 'Dois Riachos',
      '037' => 'Jacaré dos Homens',
      '040' => 'Jaramataia',
      '041' => 'Senador Rui Palmeira',
      '048' => 'Major Izidoro',
      '050' => 'Maravilha',
      '058' => 'Monteiropoles',
      '061' => 'Olho D\'água das Flores',
      '064' => 'Olivença',
      '065' => 'Ouro Branco',
      '066' => 'Palestina',
      '068' => 'Pão de Açucar',
      '077' => 'Poço das Trincheiras',
      '085' => 'Santana do Ipanema',
      '089' => 'São José da Tapera',
      # Unidade Agreste
      '003' => 'Arapiraca',
      '014' => 'Campo Alegre',
      '015' => 'Campo Grande',
      '020' => 'Coité do Noia',
      '024' => 'Craibas',
      '027' => 'Feira Grande',
      '032' => 'Girau do Ponciano',
      '034' => 'Igaci',
      '035' => 'Igreja Nova',
      '044' => 'Junqueiro',
      '045' => 'Lagoa da Canoa',
      '063' => 'Olho D\'água Grande',
      '073' => 'Piaçabuçu',
      '087' => 'São Braz',
      '094' => 'São Sebastião',
      '097' => 'Taquarana',
      '098' => 'Traipu',
      # Unidade Serrana
      '002' => 'Anadia',
      '017' => 'Capela',
      '029' => 'Estrela de Alagoas',
      '052' => 'Maribondo',
      '053' => 'Mar Vermelho',
      '057' => 'Minador do Negrão',
      '067' => 'Palmeira dos Índios',
      '071' => 'Paulo Jacinto',
      '075' => 'Pindoba',
      '081' => 'Quebrangulo',
      # Unidade Leste
      '006' => 'Barra De São Miguel',
      '021' => 'Colonia Leopoldina',
      '022' => 'Coqueiro Seco',
      '030' => 'Flexeiras',
      '033' => 'Ibateguara',
      '038' => 'Jacuipe',
      '039' => 'Japaratinga',
      '042' => 'Joaquim Gomes',
      '043' => 'Jundiá',
      '049' => 'Maragogi',
      '055' => 'Matriz de Camaragibe',
      '056' => 'Messias',
      '059' => 'Murici',
      '060' => 'Novo Lino',
      '069' => 'Paripueira',
      '070' => 'Passo de Camaragibe',
      '074' => 'Pilar',
      '079' => 'Porto de Pedras',
      '082' => 'Rio Largo',
      '084' => 'Santa Luzia do Norte',
      '095' => 'Satuba',
      # Unidade Benedito Bentes
      '471' => 'Maceió - Unidade Benedito Bentes',
      '475' => 'Maceió - SANAMA Benedito Bentes',
      # Unidade Farol
      '472' => 'Maceió - Unidade Farol',
      '474' => 'Maceió - SANEMA',
      # Unidade jaraguá
      '473' => 'Maceió  - Unidade Jaraguá'
    }
  end
end
