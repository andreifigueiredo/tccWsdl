class ExcecaosController < ApplicationController
  before_action :authenticate_developer!
  before_action :get_excecao, only: [:show]
  before_action :get_developers, only: [:show]

  def index
    @excecaos = Excecao.all.group(:error).count
  end

  def show
  end

  private
    def get_excecao
      @excecao = Excecao.find(params[:id])
      @dono_excecao = DonoExcecao.find_by_excecao_id(@excecao.id)
    end

    def get_developers
      @developers = Developer.where(team_id: @excecao.project.team.id)
    end
end
