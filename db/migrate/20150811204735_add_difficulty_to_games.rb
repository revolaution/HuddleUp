class AddDifficultyToGames < ActiveRecord::Migration
  def change
    add_column :games, :difficulty, :string
  end
end
