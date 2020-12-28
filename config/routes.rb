Rails.application.routes.draw do
   
  devise_for :users
  namespace :conta do
    resources :cod_barra, only: %i[index show]
    resources :display, only: %i[index show]
    get 'search/index'
  end
  
  root to: "arquivos#index"
  resources :arquivos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
