class User < ApplicationRecord
  has_many :rentals
  has_many :games
end
