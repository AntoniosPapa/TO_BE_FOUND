# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Post.destroy_all
Organisation.destroy_all
User.destroy_all

puts "populate database with users.."

user_photos =  ["https://images.pexels.com/photos/2269872/pexels-photo-2269872.jpeg?auto=compress&cs=tinysrgb&w=1200", "https://images.pexels.com/photos/2406949/pexels-photo-2406949.jpeg?auto=compress&cs=tinysrgb&w=1200", "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1200", "https://images.pexels.com/photos/1081685/pexels-photo-1081685.jpeg?auto=compress&cs=tinysrgb&w=1200", "https://images.pexels.com/photos/3746276/pexels-photo-3746276.jpeg?auto=compress&cs=tinysrgb&w=1200"]

user_photos.each do |user_photo|
  file = URI.open(user_photo)
  user = User.new(
                  first_name: Faker::Name.first_name,
                  last_name: Faker::Name.last_name,
                  description: Faker::TvShows::FamilyGuy.quote,
                  email: Faker::Internet.email,
                  password: 123456,
                )
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: "image/png")
  user.save!
  puts "#{user.first_name} was successfully saved."

#   skills = Skills.new(name: [videographer ...].sample,
#                                  user: user,
#                                  description: Faker::TvShows::FamilyGuy.quote)
#   skills.save!
#   puts " Skills with #{skill.id} was successfully saved."
end

# puts "populate database with organiations.."

# Organisation.create!([{
#   name: "APIB - Articulation of Indigenous Peoples of Brazil",
#   address: "Brazil",
#   description: "Apib is an instance of national reference of the indigenous movement in Brazil,
# created from the bottom up. It brings together our indigenous regional organizations and
# was born with the purpose of strengthening the unity of our peoples, the articulation
# between the different indigenous regions and organizations in the country,
# in addition to mobilizing indigenous peoples and organizations against threats
# and aggressions against indigenous rights.",
#   website: "https://apiboficial.org/?lang=en"
# },
# {
#   name: "Minga Indigena",
#   address: "Columbia",
#   description: "",
#   website: "https://www.youtube.com/watch?v=y4nt7MUahOc"
# },
# {
#  name: "English",
#   address: "Pete Doct",
#   description: "C.",
#   website:
# }])
# p "Created #{Book.count} Books"
