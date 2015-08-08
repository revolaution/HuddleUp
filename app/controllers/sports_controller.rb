class SportsController < ApplicationController
  def show
    @sport = Sport.find(params[:id])
    @games = @sport.games.select{|game| game.location == Location.find(params[:location_id])}
  end
end
