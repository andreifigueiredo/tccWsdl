class ExcecaosController < ApplicationController
  before_action :authenticate_developer!
  before_action :set_excecao, only: [:show]

  def index
    @excecaos = Excecao.all.group(:error).count
  end

  def show
  end

  private
    def set_excecao
      @excecao = Excecao.find(params[:id])
      @dono_excecao = DonoExcecao.find_by_excecao_id(@excecao.id)
    end
end
