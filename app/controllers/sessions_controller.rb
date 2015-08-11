class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    if @user
      Sport.all.each do |sport|
        UsersSport.find_or_create_by(user: @user, sport: sport)
      end
      session[:user_id] = @user.id
      redirect_to @user, notice: "Signed In"
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed Out"
  end

  protected
    def auth_hash
      request.env["omniauth.auth"]
    end
end
