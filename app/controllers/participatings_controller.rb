class ParticipatingsController < ApplicationController
  def new
    Participating.create(user: current_user, game: params[:id])
    redirect_to sport_game_path
  end
end
