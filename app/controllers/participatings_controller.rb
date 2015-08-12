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

  def team_add
    @team = Team.find(params[:id])
    @team.users.each do |user|
      if !@game.participants.include?(user)
        Participating.create(participant: user, game: @game)
      end
    end
    redirect_to location_sport_game_path(@location, @sport, @game)
  end

  def leave_game
    if @game.participants.include?(current_user) && current_user != @game.creator
      @participating = Participating.find_by(participant: current_user, game: @game)
      @participating.destroy
      redirect_to location_sport_game_path(@location, @sport, @game)
    else
      redirect_to :back
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
