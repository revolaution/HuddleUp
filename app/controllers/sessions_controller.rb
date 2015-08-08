class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]
    session[:omniauth] = auth_hash.except('extra')
    p session[:omniauth]
    p session[:omniauth][:credentials][:token]
    user = User.sign_in_from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed In"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url, notice: "Signed Out"
  end

  # protected

  #   def auth_hash
  #     request.env["omniauth.auth"]
  #   end
end
