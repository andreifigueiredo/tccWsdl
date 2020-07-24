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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
end