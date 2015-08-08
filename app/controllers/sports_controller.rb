class SportsController < ApplicationController
  def show
    @sport = Sport.find(params[:id])
  end
end
