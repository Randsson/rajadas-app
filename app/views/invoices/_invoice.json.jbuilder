json.extract! invoice, :id, :matricula, :valor_recebido, :data_pagamento, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
