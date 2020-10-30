class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :matricula
      t.decimal :valor_recebido
      t.string :data_pagamento

      t.timestamps
    end
  end
end
