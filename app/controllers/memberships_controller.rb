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
    if current_user_included?(@team) && team_creator?
      @membership = find_membership
      @membership.destroy
      @team.destroy
    elsif current_user_included?(@team)
      @membership = find_membership
      @membership.destroy
    end
    redirect_to user_path(current_user)
  end

  private
  def team_creator?
    @team.creator == current_user
  end

  def current_user_included?(team)
    current_user && team.users.include?(current_user)
  end

  def find_membership
    Membership.find_by(team: @team, user: current_user)
  end
end
