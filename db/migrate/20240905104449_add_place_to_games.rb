class AddPlaceToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :place, :string
  end
end
