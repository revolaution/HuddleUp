require 'rails_helper'

describe Game do
	let(:soccer) {Sport.create(name: "Soccer!", description:"Kick a ball")}
	let(:chi) {Location.create(name: "Michigan")}
	let(:matt) {User.create(provider: "facebook", uid: "123123123", name: "McGreenBeats", email: "green@green.com", location: chi)}
	let(:game) {Game.create(max_number_of_participants: 5, description: "Let's play", creator: matt, sport: soccer, start_at: 0500, end_at: 0600, location: chi, address: "north beach")}

	describe "#current_particpants_count" do
		it "should return the total number of participants currently" do
			expect(game.current_participants_count).to eq 0
		end
	end

	describe "#available_space" do
		it "should return the number of available space" do
			expect(game.available_space).to eq 5
		end
	end

	describe "#not_full?" do
		it "should not be full upon creation" do
			expect(game.not_full?).to be true
		end

		it "should return false when it's full" do
			5.times do
				game.participatings.create(participant: matt)
			end
			expect(game.not_full?).to be false
		end
	end
end