class RemoveDescriptionFromSports < ActiveRecord::Migration
  def change
    remove_column :sports, :description, :string
  end
end
