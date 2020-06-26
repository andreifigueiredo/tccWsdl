class Api::V1::ExcecaosController < ApplicationController
  include ExcecaoHelper
  
  def create
    binding.pry
    @excecao = create_excecoes(excecao_params)
    if @excecao
      render json: @excecao, status: :created
    else
      render json:  @excecao.errors, status: :unprocesable_entity
    end
  end

  private
  def excecao_params
    params.require(:excecao).permit(:acao, :excecao, :http, :objSessao, :parametros)
  end
end