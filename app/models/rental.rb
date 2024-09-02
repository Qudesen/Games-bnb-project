class Rental < ApplicationRecord
  # validates :start_date, :end_date, :price, presence: true

  belongs_to :user
  belongs_to :game
end
