class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def game_creator?(game)
    current_user == game.creator
  end
  helper_method :game_creator?

  def current_creator_has_valid_teams(game)
    current_user && current_user == game.creator && game.valid_teams.count > 0
  end
  helper_method :current_creator_has_valid_teams

  def user_can_join(game)
    current_user && game.not_full? && !game.participants.include?(current_user)
  end
  helper_method :user_can_join

  def user_can_leave(game, participating)
    current_user && current_user != game.creator && participating
  end
  helper_method :user_can_leave

  def user_with_location
    current_user && current_user.location
  end
  helper_method :user_with_location

  def user_not_on_team
    current_user && !@team.users.include?(current_user)
  end
  helper_method :user_not_on_team

  def user_on_team
    current_user && @team.users.include?(current_user)
  end
  helper_method :user_on_team

  def user_has_no_location
    on_current_user_page && !@user.location
  end
  helper_method :user_has_no_location

  def user_has_location
    on_current_user_page && @user.location
  end
  helper_method :user_has_location

  def on_current_user_page
    current_user == @user
  end
  helper_method :on_current_user_page
end
