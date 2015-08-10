require 'rails_helper'

RSpec.describe SportsController, :type => :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/locations/1/sports/1").to route_to("sports#show", location_id: "1", id: "1")
    end
  end
end
