class SportsController < ApplicationController
  def index
    session[:user_id] = 1
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
  end
end
