class RemoveLatLongFromGames < ActiveRecord::Migration
  def change
  	remove_column :games, :latitude, :float
  	remove_column :games, :longitude, :float
  end
end
