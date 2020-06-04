class ExcecaosController < ApplicationController
  before_action :authenticate_developer!
  before_action :set_excecao, only: [:show]
  before_action :set_dono_excecao, only: [:show]
  before_action :get_developers, only: [:show]

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

    def set_dono_excecao
      @dono_excecao = DonoExcecao.find(params[:id])
    end

    def get_developers
      @developers = Developer.all
    end
end
