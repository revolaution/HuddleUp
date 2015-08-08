class WelcomeController < ApplicationController
  def index
    # session[:user_id] = 1
    @locations = Location.all
  end
end
