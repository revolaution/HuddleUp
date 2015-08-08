require 'rails_helper'

RSpec.describe ParticipatingsController, :type => :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/locations/1/sports/1/games/1/participatings/new").to route_to("participatings#new", location_id: "1", sport_id: "1", game_id: "1")
    end
  end
end
