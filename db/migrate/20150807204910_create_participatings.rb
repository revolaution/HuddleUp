class CreateParticipatings < ActiveRecord::Migration
  def change
    create_table :participatings do |t|
      t.references :user, null: false
      t.references :game, null: false

      t.timestamps null: false
    end
  end
end
