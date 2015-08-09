class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :max_number_of_participants
      t.string :description
      t.references :user
      t.references :sport
      t.time :start_at
      t.time :end_at
      t.references :location
      t.string :address
      t.date :date

      t.timestamps null: false
    end
  end
end
