class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to current_user
    end
    @locations = Location.all
  end

end
