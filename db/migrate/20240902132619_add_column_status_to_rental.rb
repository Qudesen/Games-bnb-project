class AddColumnStatusToRental < ActiveRecord::Migration[7.1]
  def change
    add_column :rentals, :status, :string
  end
end
