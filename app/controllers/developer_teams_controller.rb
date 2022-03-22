class DeveloperTeamsController < ApplicationController
  before_action :set_team, only: [:edit, :update]
  before_action :get_developers, only: [:edit, :update]
  before_action :authenticate_developer!


  # GET /developer_teams/1/edit
  def edit
  end


  # PATCH/PUT /developer_teams/1
  # PATCH/PUT /developer_teams/1.json
  def update
    respond_to do |format|
      if developerTeamParams
        developers_ids = @developers.pluck(:id)

        (developers_ids - params[:developer_ids]).each do |id|
          developer = Developer.find(id)
          if developer.team_id == @team.id 
            developer.update(team: nil)
          end
        end
        (params[:developer_ids] - developers_ids).each do |id|
          developer = Developer.find(id)
          developer.update(team: @team)
        end
          format.html {redirect_to @team, notice: 'developers was successfully updated.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developerTeamParams
      params.permit(:developer_ids)
    end

    def get_developers
      @developers = Developer.all
    end
end