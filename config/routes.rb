Rails.application.routes.draw do
  namespace :conta do
    get 'display/index'
  end
  
  root to: "arquivos#index"
  resources :invoice_items
  resources :arquivos
  resources :invoices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
