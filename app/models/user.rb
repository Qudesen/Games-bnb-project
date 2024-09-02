class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # validates :email, :username, :phone_number, :password, presence: true
  # validates :email, :username, uniqueness: true

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :rentals
  has_many :games
  has_many :rented_games, through: :rentals, source: :game
end
