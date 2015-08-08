class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @sports = @location.games.map{|game| game.sport}.uniq
  end
end
