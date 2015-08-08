class CreateUsersSports < ActiveRecord::Migration
  def change
    create_table :users_sports do |t|
      t.references :user
      t.references :sport
      t.string :skill_level

      t.timestamps null: false
    end
  end
end
