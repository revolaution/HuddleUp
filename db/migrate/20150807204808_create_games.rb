class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :max_number_of_participants, null: false
      t.string :description, null: false
      t.references :user, null: false
      t.references :sport, null: false
      t.time :start_at, null: false
      t.time :end_at, null: false
      t.references :location, null: false
      t.string :address, null: false
      t.date :date, null: false

      t.timestamps null: false
    end
  end
end
