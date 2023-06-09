# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning DB"
Restaurant.destroy_all

puts "Creating restaurants"

CATEGORIES = %w(chinese italian japanese french belgian)

25.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  2.times do
    p "creating reviews"
    review = Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant_id: restaurant.id
    )
    puts "Restaurant with id: #{review.id} - has been created!"
  end

  puts "Restaurant with id: #{restaurant.id} - #{restaurant.name} has been created!"
end

puts "Done!"
