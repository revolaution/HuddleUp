class WelcomeController < ApplicationController
  def index
    @locations = Location.all
  end

end
