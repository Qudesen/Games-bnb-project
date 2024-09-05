class ChangeRentalStatusColumnType < ActiveRecord::Migration[7.1]
  def change
    remove_column(:rentals, :status)
    add_column(:rentals, :status, :integer, default: 1)
  end
end
