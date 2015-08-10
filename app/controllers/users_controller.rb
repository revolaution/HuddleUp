class UsersController < ApplicationController
  before_action :load_user, only: [:show, :update]

  def index
  end

  def show
    @games_today = @user.games.select{|game| game.date == Date.today}
    @games_created = @user.created_games
    @games_upcoming = @user.games.select{|game| game.date > Date.today}
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
