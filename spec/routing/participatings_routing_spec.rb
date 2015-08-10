require 'rails_helper'

RSpec.describe ParticipatingsController, :type => :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/locations/1/sports/1/games/1/participatings").to route_to("participatings#create", location_id: "1", sport_id: "1", game_id: "1")
    end
  end
end
