class SportsController < ApplicationController
  before_action :load_location, :load_date, only: [:show]


  def show
    if @date == Date.today
      @date_display = "#{@date.to_s} (Today)"
    else
      @date_display = @date.to_s
    end
    @sport = Sport.find(params[:id])
    @games = @sport.games.select{|game| game.location == @location && game.sport == @sport && game.date == @date}
  end

  private
    def load_location
      @location = Location.find(params[:location_id])
    end

    def load_date
      if params[:date]
      @date = params[:date].to_date
      else
        @date = Date.today
      end
    end
end
