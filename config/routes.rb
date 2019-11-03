Rails.application.routes.draw do
  wash_out :wsdl_services

  resources :dados_excecao, only: [:index]
end
