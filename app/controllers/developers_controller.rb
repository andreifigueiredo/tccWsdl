class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update]
  before_action :get_teams, only: [:edit]
  before_action :authenticate_developer!

  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  # GET /developers/1
  # GET /developers/1.json
  def show
    excecao_counts = @developer.team.project.excecaos.group(:error).count if @developer.team
    @excecaos_n_atribuido_count = []
    @excecaos_n_atribuido = []
    @excecaos_atribuido_count = []
    @excecaos_atribuido = []
    @excecaos_resolvido_count = []
    @excecaos_resolvido = []
    if @developer.team
      excecao_counts.each do |excecao_count|
        @excecao = Excecao.where(error: excecao_count[0]).last
        
        # binding.pry
        
        if @excecao.dono_excecao.developer_id.nil?
          @excecaos_n_atribuido_count << excecao_count[1]
          @excecaos_n_atribuido << @excecao
        elsif @excecao.dono_excecao.solved == true
          @excecaos_resolvido_count << excecao_count[1]
          @excecaos_resolvido << @excecao
        else
          @excecaos_atribuido_count << excecao_count[1]
          @excecaos_atribuido << @excecao
        end
      end
    end
  end

  # GET /developers/1/edit
  def edit
  end

  # PATCH/PUT /developers/1
  # PATCH/PUT /developers/1.json
  def update
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: 'developer was successfully updated.' }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:email, :admin, :team_id)
    end

    def get_teams
      @teams = Team.all
    end

end