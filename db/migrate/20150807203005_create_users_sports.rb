class CreateUsersSports < ActiveRecord::Migration
  def change
    create_table :users_sports do |t|
      t.references :user, null: false
      t.references :sport, null: false
      t.string :skill_level, default: "Beginner"

      t.timestamps null: false
    end
  end
end
