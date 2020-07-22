class DeveloperReportController < ApplicationController
  before_action :set_developer
  before_action :authenticate_developer!
  include RelatorioHelper

  def show
    @member_exception_solved = member_exception_solved(@developer)
    @member_average_time_exception_solved = member_average_time_exception_solved(@developer)
    @member_exception_solved_per_month = member_exception_solved_per_month(@member_exception_solved_per_month)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end
end