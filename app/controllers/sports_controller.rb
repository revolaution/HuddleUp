class SportsController < ApplicationController
  before_action :load_location, :load_date, :load_sport, only: [:show, :navigate]

  def show
    @date = Date.today unless @date
    if @date == Date.today
      @date_display = "#{@date.strftime("%A, %d %b %Y")} (Today)"
    else
      @date_display = @date.strftime("%A, %d %b %Y")
    end
    @games = @sport.games.select{|game| game.location == @location && game.sport == @sport && game.date == @date}.sort{|a,b| b.available_space <=> a.available_space }
    if current_user
      @users_sport = current_user.users_sports.select{|users_sport| users_sport.sport == @sport}.first
      @games.select!{|game| game.difficulty == @users_sport.skill_level}
    end
  end

  def navigate
    @new_date = navigate_params["new_date"]
    redirect_to location_sport_path(@location, @sport, date: @new_date)
  end

  private
    def load_location
      @location = Location.find(params[:location_id])
    end

    def load_sport
      @sport = Sport.find(params[:id])
    end

    def load_date
      if params[:date]
      @date = params[:date].to_date
      else
        @date = Date.today
      end
    end

    def navigate_params
      params.require(:sport).permit(:new_date)
    end
end
