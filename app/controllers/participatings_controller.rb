class ParticipatingsController < ApplicationController
  before_action :load_location, :load_sport, :load_game

  def create
    if @game.participants.include?(current_user)
      redirect_to :back
    else
      Participating.create(participant: current_user, game: @game)
      redirect_to location_sport_game_path(@location, @sport, @game)
    end
  end

  private
    def load_location
      @location = Location.find(params[:location_id])
    end

    def load_sport
      @sport = Sport.find(params[:sport_id])
    end

    def load_game
      @game = Game.find(params[:game_id])
    end
end
