class RemovePlaceFromGames < ActiveRecord::Migration[7.1]
  def change
    remove_column(:games, :place)
  end
end
