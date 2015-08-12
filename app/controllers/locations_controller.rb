class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @sports = Sport.all.each_slice(4).to_a
  end
end
