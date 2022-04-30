class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_developer!

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    excecao_counts = @project.excecaos.group(:error).count
    @excecaos_n_atribuido_count = []
    @excecaos_n_atribuido = []
    @excecaos_atribuido_count = []
    @excecaos_atribuido = []
    @excecaos_resolvido_count = []
    @excecaos_resolvido = []
    excecao_counts.each do |excecao_count|
      @excecao = Excecao.where(error: excecao_count[0], project_id: @project.id).last
      
      
      if @excecao.dono_excecao.developer_id.nil?
        @excecaos_n_atribuido_count << excecao_count[1]
        @excecaos_n_atribuido << @excecao
      elsif @excecao.dono_excecao.solved == true
        @excecaos_resolvido_count << excecao_count[1]
        @excecaos_resolvido << @excecao
      else
        # binding.pry
        @excecaos_atribuido_count << excecao_count[1]
        @excecaos_atribuido << @excecao
      end
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_code
    @project = Project.find(params[:project_id])

    if @project.generate_code
      respond_to do |format|
        format.html { redirect_to @project, notice: 'Code was successfully generated.' }
        format.json { render :show, status: :ok, location: @project }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end

end
