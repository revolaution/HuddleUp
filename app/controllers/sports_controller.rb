class SportsController < ApplicationController
  before_action :load_location, only: [:show]

  def show
    @sport = Sport.find(params[:id])
    @games = @sport.games.select{|game| game.location == @location && game.sport == @sport}
  end

  private
    def load_location
      @location = Location.find(params[:location_id])
    end
end
