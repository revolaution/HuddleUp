class ParticipatingsController < ApplicationController
  def new
    Participating.create(participant: current_user, game: Game.find(params[:game_id]))
    redirect_to location_sport_game_path(id: params[:game_id])
  end
end
