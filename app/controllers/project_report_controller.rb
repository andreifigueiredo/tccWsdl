class ProjectReportController < ApplicationController
  before_action :set_project
  before_action :authenticate_developer!
  include RelatorioHelper

  def show
    @average_exception_solved = average_exception_solved(@project)
    @average_exception_solved_per_member = average_exception_solved_per_member(@project)
    @new_exceptions_per_month = new_exceptions_per_month(@new_exceptions_per_month)
    @exceptions_solved_per_month = exceptions_solved_per_month(@exceptions_solved_per_month)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end