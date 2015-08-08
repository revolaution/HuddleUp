class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @participants = @game.participants
    @current_user = current_user
  end

  def new
    @game = Game.new
  end

  def create
  	@game = Game.new(game_params)
  	@game.creator = current_user
  	@game.location = Location.find(params[:location_id])
  	@game.sport = Sport.find(params[:sport_id])
  	if @game.save
  		redirect_to location_sport_game_path(location_id: @game.location.id, sport_id: @game.sport.id, id: @game.id)
  	else
  		render 'new'
  	end
  end

  private
  	def game_params
  		params.require(:game).permit(:description, :max_number_of_participants, :start_at, :end_at, :address)
  	end
end
