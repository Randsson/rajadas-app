Rails.application.routes.draw do
  resources :invoice_items
  resources :arquivos
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
