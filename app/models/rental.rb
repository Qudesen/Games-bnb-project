class Rental < ApplicationRecord
  # validates :start_date, :end_date, :price, presence: true
  enum status: { ongoing: 0, confirmed: 1, done: 2, canceled: 3 }
  STATUSES = { ongoing: "En cours", confirmed: "Confirmée", done: "Terminée", canceled: "Annulée" }

  belongs_to :user
  belongs_to :game
end
