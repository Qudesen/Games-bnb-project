class Game < ApplicationRecord
  # validates :name, :description, :price_per_day, :address, presence: true
  # validates :price_per_day, numericality: { greater_than: 0 }

  belongs_to :user
  has_one_attached :picture
end
