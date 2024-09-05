class AddCityToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :city, :string
    add_column :games, :quarter, :string
  end
end
