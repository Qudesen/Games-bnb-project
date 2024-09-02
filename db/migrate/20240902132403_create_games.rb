class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.float :price_per_day
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
