class AddImagePathToSports < ActiveRecord::Migration
  def change
    add_column :sports, :image_path, :string
  end
end
