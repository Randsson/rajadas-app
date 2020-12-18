Rails.application.routes.draw do
   
  devise_for :users
  namespace :conta do
    get 'cod_barra/index'
    resources :display, only: %i[index show]
    get 'search/index'
  end
  
  root to: "arquivos#index"
  resources :arquivos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
