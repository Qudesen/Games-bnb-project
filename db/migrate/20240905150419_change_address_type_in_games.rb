class ChangeAddressTypeInGames < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :address, :string
  end
end
