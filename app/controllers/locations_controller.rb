class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @sports = Sport.all.each_slice(3).to_a
  end
end
