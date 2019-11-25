Rails.application.routes.draw do
  resources :projects
  devise_for :developers
  get 'home/index'
  get 'excecaos/index'
  wash_out :wsdl_services

  resources :excecaos, only: [:index, :show]

  root to: 'home#index'
end
