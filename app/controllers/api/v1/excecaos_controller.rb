class Api::V1::ExcecaosController < ApplicationController
  include ExcecaoHelper
  
  def create
    create_excecoes(params)
  end
end