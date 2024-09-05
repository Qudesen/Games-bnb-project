class Game < ApplicationRecord
  # validates :name, :description, :price_per_day, :address, presence: true
  # validates :price_per_day, numericality: { greater_than: 0 }

  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_validation :add_city_to_model

  private

  def add_city_to_model
    sleep(2)
    result = Geocoder.search(address)
    if result
      city = result.first.data["address"]["city"]
      quarter = result.first.data["address"]["quarter"]
      self.city = city if city
      self.quarter = quarter if quarter
    end
  end
end
