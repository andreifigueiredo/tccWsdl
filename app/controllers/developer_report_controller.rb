class DeveloperReportController < ApplicationController
  before_action :set_developer
  before_action :authenticate_developer!
  include RelatorioHelper

  def show
    @member_exception_solved = member_exception_solved(@developer)
    @member_exception_pending = member_exception_pending(@developer)
    @member_average_time_exception_solved = member_average_time_exception_solved(@developer)
    @member_average_exception_solved_per_month = member_average_exception_solved_per_month(@developer)

    @dataAverage = []
    @dataQtd = []
    start_month = 12
    while start_month >= 0
      solved = 0
      countUnsolved = 0
      countSolved = 0
      @developer.dono_excecaos.where(updated_at: (Time.now-start_month.months).beginning_of_month..(Time.now-start_month.months).end_of_month).each do |excecao|
        if excecao.solved
          solved += (Time.zone.at(excecao.updated_at - excecao.created_at)).day
          countSolved += 1
        else
          countUnsolved += 1
        end
      end
      solvedAverage = 0
      solvedAverage = solved/countSolved unless countSolved == 0
      @dataAverage.push([(Time.now-start_month.months).to_f * 1000, solvedAverage])
      @dataQtd.push([(Time.now-start_month.months).to_f * 1000, countSolved,countUnsolved])
      start_month -= 1
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end
end