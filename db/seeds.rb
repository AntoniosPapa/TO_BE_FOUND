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

  # skills_offer = SkillsOffer.new(name: [videographer ...].sample,
  #                                user: user,
  #                                description: Faker::TvShows::FamilyGuy.quote)
  # skills_offer.save!
  # puts " Skills_offer with #{skills_offer.id} was successfully saved."
end

# puts "populate database with organiations.."

# Organisation.create!([{
#   name: "Physics",
#   address: "Pete Docter",
#   description: "A.",
#   read_on: 1.week.ago
# },
# {
#   title: "Biology",
#   author: "Pete Docter",
#   description: "B.",
#   read_on: 2.years.ago
# },
# {
#  title: "English",
#   author: "Pete Doct",
#   description: "C.",
#   read_on: 3.years.ago
# }])
# p "Created #{Book.count} Books"
