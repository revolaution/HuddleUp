class GamesController < ApplicationController
  before_action :load_location
  before_action :load_sport
  before_action :load_game, except: [:new, :create]

  def show
    @participants = @game.participants
    @participant = Participating.new
  end

  def new
    @game = Game.new
  end

  def create
  	@game = Game.new(game_params)
    @game.sport = @sport
    @game.location = @location
  	@game.creator = current_user
    if @game.save
      @game.participatings.create(participant: current_user)
  		redirect_to location_sport_game_path(@location, @sport, @game)
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def destroy
    @game.destroy
    redirect_to location_sport_path(@location, @sport)
  end

  def update
    @game.update(game_params)
    redirect_to location_sport_game_path(@location, @sport, @game)
  end

  private
  	def game_params
  		params.require(:game).permit(:description, :max_number_of_participants, :start_at, :end_at, :address)
  	end

    def load_location
      @location = Location.find(params[:location_id])
    end

    def load_sport
      @sport = Sport.find(params[:sport_id])
    end

    def load_game
      @game = Game.find(params[:id])
    end
end
