require 'rails_helper'

RSpec.describe GamesController, :type => :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/locations/1/sports/1/games/1").to route_to("games#show", location_id: "1", sport_id: "1", id: "1")
    end

    it "routes to #new" do
      expect(:get => "/locations/1/sports/1/games/new").to route_to("games#new", location_id: "1", sport_id: "1")
    end
  end
end
