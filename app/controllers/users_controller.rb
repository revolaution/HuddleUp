class UsersController < ApplicationController
  def index
  end

  def show
    @locations = Location.all
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to @user unless @user == current_user
    @user.location = Location.find(city_params["location_id"])
    @user.save
    redirect_to @user.location
  end

  private
  def city_params
    params.require(:user).permit(:location_id)
  end
end
