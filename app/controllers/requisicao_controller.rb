class RequisicaoController < ApplicationController

  before_action :set_requisicao, only: [:show]

  def index
    @requisicaos = Requisicao.all
  end

  def show
  end

  private
    def set_requisicao
      @requisicao = Requisicao.find(params[:id])
    end
end
