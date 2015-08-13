class GamesController < ApplicationController
  before_action :load_location
  before_action :load_sport
  before_action :load_game, except: [:new, :create]

  def show
    @participants = @game.participants
    @participant = Participating.new
    if current_user && @game.participants.include?(current_user)
      @participating = Participating.find_by(participant: current_user, game: @game)
    end
  end

  def new
    redirect_to_sport(@location, @sport) unless current_user
    @date = params[:date]
    @game = Game.new
    if !@game.start_at
      @game.start_at = (Time.now - 4.hours).beginning_of_hour
    end
    if !@game.end_at
      @game.end_at = (Time.now - 2.hours).beginning_of_hour
    end

    if request.xhr?
      render 'new', layout: false
    end
  end

  def create
    if current_user
    	@game = Game.new(game_params)
      @game.sport = @sport
      @game.location = @location
    	@game.creator = current_user
      if @game.save
        @game.participatings.create(participant: current_user)
    		redirect_to_game(@location, @sport, @game)
    	else
    		render 'new'
    	end
    else
      redirect_to_sport(@location, @sport)
    end
  end

  def edit
    redirect_to_sport(@location, @sport) unless valid_creator
  end

  def destroy
    if valid_creator
      @game.destroy
    end
    redirect_to_sport(@location, @sport)
  end

  def update
    if valid_creator
      if @game.update(game_params)
        redirect_to_game(@location, @sport, @game)
      else
        render 'edit'
      end
    else
      redirect_to location_sport_path(@location, @sport)
    end
  end

  private
  	def game_params
  		params.require(:game).permit(:description, :max_number_of_participants, :start_at, :end_at, :address, :date, :difficulty)
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

    def redirect_to_game(location, sport, game)
      redirect_to location_sport_game_path(location, sport, game)
    end

    def redirect_to_sport(location, sport)
      redirect_to location_sport_path(location, sport)
    end

    def valid_creator
      current_user && current_user == @game.creator
    end
end
