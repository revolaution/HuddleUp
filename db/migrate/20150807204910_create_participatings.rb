class CreateParticipatings < ActiveRecord::Migration
  def change
    create_table :participatings do |t|
      t.references :user
      t.references :game

      t.timestamps null: false
    end
  end
end
