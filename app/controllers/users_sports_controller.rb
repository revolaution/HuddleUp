class UsersSportsController < ApplicationController

  def change_skill
    filter_date = params[:format]
    @location = Location.find(params[:location_id])
    @sport = Sport.find(params[:id])
    redirect_to @location unless current_user
    @skill = UsersSport.find_by(sport: @sport, user: current_user)
    @skill.skill_level = skill_params["skill_level"]
    @skill.save
    redirect_to "/locations/#{@location.id}/sports/#{@sport.id}?date=#{filter_date}"
  end

  private
    def skill_params
      params.require(:users_sport).permit(:skill_level)
    end
end
