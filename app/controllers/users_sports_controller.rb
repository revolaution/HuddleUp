class UsersSportsController < ApplicationController
  def index
  end

  def update
    @user = current_user
    redirect_to @user unless @user == current_user
    @user.location = Location.find(city_params["location_id"])
    @user.save
    redirect_to @user.location
  end

end
