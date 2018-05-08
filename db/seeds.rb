require 'faker'

#Destroy all seeds before populating new ones
#In case there's re-seeding that needs to be done.
# Admin.destroy_all
# Property.destroy_all
# Sector.destroy_all
# Unit.destroy_all
# Tenant.destroy_all


# Helper Method to make a full address ("123 Street, City")
# def address
#     Faker::Address.street_address + ", "+ Faker::Address.city
# end

2.times do
  Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8), hint_password: "hi there")
end

32.times do
  Tenant.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8), hint_password: "hi there", unit_id: rand(1..16))
end

4.times do
  Property.create(name: Faker::Address.community, admin_id: rand(1..2))
end

8.times do
  Sector.create(name: Faker::Number.between(1, 25), property_id: rand(1..8))
end

16.times do
  Unit.create(name: Faker::Number.between(1, 100), sector_id: rand(1..8))
end


# puts Tenant.create(first_name: "Ian", last_name: "Pollack", email: "ian@email.com", password: "password", hint_password: "self")

# puts Unit.create(name: "Marshall Hill Apartments")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
