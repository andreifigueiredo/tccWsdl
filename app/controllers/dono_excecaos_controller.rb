class DonoExcecaosController < ApplicationController
  before_action :get_dono_excecao, only: [:show, :edit, :update]
  before_action :get_developers, only: [:edit]
  before_action :authenticate_developer!

  def show
  end

  # GET /dono_excecaos/1/edit
  def edit
  end


# PATCH/PUT /dono_excecaos/1
# PATCH/PUT /dono_excecaos/1.json
  def update
    respond_to do |format|
      if @dono_excecao.update(dono_excecao_params)
        format.html { redirect_to @dono_excecao.excecao, notice: 'dono_excecao was successfully updated.' }
        format.json { render :show, status: :ok, location: @dono_excecao.excecao }
      else
        format.html { render :edit }
        format.json { render json: @dono_excecao.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_dono_excecao
      @dono_excecao = DonoExcecao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dono_excecao_params
      params.require(:dono_excecao).permit(:developer_id, :solved, :evaluate, :observation)
    end

    def get_developers
      @developers = Developer.where(team: @dono_excecao.excecao.project.team)
    end
end