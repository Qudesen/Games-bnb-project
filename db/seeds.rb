# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"

puts "Processing seeds..."
puts "Destroying all records..."

Rental.destroy_all
Game.destroy_all
User.destroy_all

puts "All records destroyed!"
puts "Creating users"
# Create 10 users

sylvain = User.create!(
  email: "sylvain@gmail.com",
  username: "sylvaind",
  phone_number: "06 01 02 03 04",
  password: 123456
)

redha = User.create!(
  email: "redhab@gmail.com",
  username: "redhab",
  phone_number: "06 01 02 03 04",
  password: 123456
)

pakal = User.create!(
  email: "pakal@gmail.com",
  username: "pakalh",
  phone_number: "06 01 02 03 04",
  password: 123456
)

ali = User.create!(
  email: "ali@gmail.com",
  username: "aliad",
  phone_number: "06 01 02 03 04",
  password: 123456
)

jeremie = User.create!(
  email: "jeremie@gmail.com",
  username: "jeremiel",
  phone_number: "06 01 02 03 04",
  password: 123456
)

quentin = User.create!(
  email: "quentin@gmail.com",
  username: "quentind",
  phone_number: "06 01 02 03 04",
  password: 123456
)

puts "Creating games"

# Create 10 games
10.times do
  game = Game.new(
    name: ["Echec", "Monopoly", "Uno", "Poker", "Tarot", "Belote", "Scrabble", "Dixit", "Mille Bornes", "Pictionary"].sample,
    description: ["Voici une description du jeu, ce jeu est un jeu de société très amusant", "Voici une description du jeu, ce jeu est un jeu de société très amusant, Voici une description du jeu, ce jeu est un jeu de société très amusant."].sample,
    price_per_day: [1.2, 2.3, 3.5, 6.8].sample,
    address: [" 1 rue de la République, Aix en provence", "2 bd longchamp, marseille", "10 av des Champs Elysées, Paris"].sample
) 
  game.user = User.all.sample
  game.save
end

puts "Creating rentals"

# Create 10 rentals
10.times do
  rental = Rental.new(
    price: Faker::Number.decimal(l_digits: 2),
    start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
    status: ["pending", "accepted", "rejected"].sample,
)
  rental.user = User.all.sample
  rental.game = Game.all.sample
  rental.save
end

puts "Seeds processed!"
