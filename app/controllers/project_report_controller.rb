class ProjectReportController < ApplicationController
  before_action :set_project
  before_action :authenticate_developer!
  include RelatorioHelper

  def show
    @average_exception_solved_time = average_exception_solved(@project)
    @pending_exceptions = @project.pending_exceptions
    @solved_exceptions = @project.solved_exceptions
    @average_exception_solved_per_member_time = average_exception_solved_per_member(@project)
    @average_new_exceptions_per_month = average_new_exceptions_per_month(@project)
    @average_exceptions_solved_per_month = average_exceptions_solved_per_month(@project)

    @data = []
    start_month = 12
    while start_month >= 0
      solved = 0
      newException = 0
      @project.excecaos.where(created_at: (Time.now-start_month.months).beginning_of_month..(Time.now-start_month.months).end_of_month).each do |excecao|
        if excecao.dono_excecao.solved
          solved += 1
        else
          newException += 1
        end
      end
      @data.push([(Time.now-start_month.months).to_f * 1000, solved, newException])
      start_month -= 1
    end

    # binding.pry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end