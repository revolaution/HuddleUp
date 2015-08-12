class LocationsController < ApplicationController
	before_action :load_location, only: [:show]
	before_action :load_sports

  def show
  end

  def new
  end

  private
  	def load_location
  		@location = Location.find(params[:id])
  	end

  	def load_sports
	    @sports = Sport.all.each_slice(4).to_a
  	end
end
