class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @current_user = current_user
  end

  def new
    @game = Game.new
  end
end
