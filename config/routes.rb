Rails.application.routes.draw do
  resources :teams
  resources :projects
  devise_for :developers
  get 'home/index'
  get 'excecaos/index'

  resources :developers, only: [:index, :show, :edit, :update]
  
  resources :excecaos, only: [:index, :show]

  resources :dono_excecaos, only: [:show, :edit, :update]
  
  root to: 'home#index'
  
  namespace :api do
    namespace :v1 do
      wash_out :wsdl_services

      resources :excecaos, only: [:create]
    end
  end
end
    