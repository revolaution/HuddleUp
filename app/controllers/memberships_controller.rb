class MembershipsController < ApplicationController
  def create
    @team = Team.find(params[:id])
    if @team.users.include?(current_user)
      redirect_to :back
    else
      Membership.create(team: @team, user: current_user)
      redirect_to show_team_path(@team)
    end
  end

  def join
    @team = Team.find(params[:id])
    if !@team.users.include?(current_user)
      Membership.create(team: @team, user: current_user)
      redirect_to show_team_path(@team)
    else
      redirect_to :back
    end
  end

  def leave
    @team = Team.find(params[:id])
    if current_user && @team.users.include?(current_user)
      @membership = Membership.find_by(team: @team, user: current_user)
      @membership.destroy
      @team.destroy
    end
    redirect_to user_path(current_user)
  end
end
