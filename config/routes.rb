Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :teams
  resources :projects
  resources :project_report, only: [:show]
  devise_for :developers
  get 'home/index'
  get 'excecaos/index'

  resources :projects do
    get :generate_code
  end

  resources :developers, only: [:index, :show, :edit, :update]
  resources :developer_report, only: [:show]
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
    