class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :max_number_of_participants
      t.string :description
      t.references :user
      t.references :sport
      t.datetime :start_at
      t.datetime :end_at
      t.string :location

      t.timestamps null: false
    end
  end
end
