class UsersSportsController < ApplicationController

  def change_skill
    @location = Location.find(params[:location_id])
    @sport = Sport.find(params[:id])
    redirect_to @location unless current_user
    @skill = UsersSport.find_by(sport: @sport, user: current_user)
    @skill.skill_level = skill_params["skill_level"]
    @skill.save
    redirect_to location_sport_path(@location, @sport)
  end

  private
    def skill_params
      params.require(:users_sport).permit(:skill_level)
    end
end
