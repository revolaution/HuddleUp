class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @sports = Sport.all
  end
end
