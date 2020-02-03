class DadoExcecaosController < ApplicationController
  before_action :set_dado_excecao, only: [:edit, :update]

  # GET /dado_excecaos/1/edit
  def edit
  end


# PATCH/PUT /dado_excecaos/1
  # PATCH/PUT /dado_excecaos/1.json
  def update
    respond_to do |format|
      if @dado_excecao.update(dado_excecao_params)
        format.html { redirect_to @dado_excecao, notice: 'dado_excecao was successfully updated.' }
        format.json { render :show, status: :ok, location: @dado_excecao }
      else
        format.html { render :edit }
        format.json { render json: @dado_excecao.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dado_excecao
      @dado_excecao = dado_excecao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dado_excecao_params
      params.require(:dado_excecao).permit(:nome, :tamanho, :preco, :descricao)
    end
end