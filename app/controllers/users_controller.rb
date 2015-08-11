class UsersController < ApplicationController
  before_action :load_user, only: [:show, :update]

  def show
    @teams = @user.teams
    @games_today = @user.games_today
    @games_created = @user.games_created
    @games_upcoming = @user.games_upcoming
    @locations = Location.all
  end

  def update
    redirect_to @user unless @user == current_user
    @user.location = Location.find(city_params["location_id"])
    @user.save
    redirect_to @user.location
  end

  private

    def city_params
      params.require(:user).permit(:location_id)
    end

    def load_user
      @user = User.find(params[:id])
    end
end
