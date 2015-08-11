class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @members = @team.users
  end

  def new
    redirect_to '/' unless current_user
    @team = Team.new
  end

  def create
    if current_user
      @team = Team.new(team_params)
      @team.creator = current_user
      if @team.save
        Membership.create(user: current_user, team: @team)
        redirect_to show_team_path(@team)
      else
        render 'new'
      end
    else
      redirect_to "/"
    end
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end
