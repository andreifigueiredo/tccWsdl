class Api::V1::ExcecaosController < ApplicationController
  protect_from_forgery prepend: true
  include ExcecaoHelper
  
  def create
    @excecao = create_excecoes(params[:excecao])
    # binding.pry
    if @excecao.present?
      render json: @excecao, status: :created
    else
      render json: { message: "invalid params" }, status: :unprocesable_entity
    end
  end

  private
  # def excecao_params
  #   params.require(:excecao).permit(:acao, :excecao, :http, :objSessao, :parametros)
  # end
end