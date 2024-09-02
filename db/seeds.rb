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

# Create 20 rentals
20.times do
  Rental.create({
    price: Faker::Number.decimal(l_digits: 2),
    start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
    user_id: Faker::Number.within(range: 1..10),
    game_id: Faker::Number.within(range: 1..10),
    status: ["pending", "accepted", "rejected"].sample
})
end

puts "Seeds processed!"