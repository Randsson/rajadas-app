Rails.application.routes.draw do
  devise_for :users
   
  resources :codigos
  resources :arquivos
  
  namespace :conta do
    resources :cod_barra, only: %i[index show]
    resources :display, only: %i[index show]
    resources :search, only: %i[index]
  end
  
  root to: "arquivos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
