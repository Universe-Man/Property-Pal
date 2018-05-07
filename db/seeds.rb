require 'faker'

#Destroy all seeds before populating new ones
#In case there's re-seeding that needs to be done.
Admin.destroy_all
Property.destroy_all
Sector.destroy_all
Unit.destroy_all
Tenant.destroy_all


# Helper Method to make a full address ("123 Street, City")
# def address
#     Faker::Address.street_address + ", "+ Faker::Address.city
# end

Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "", hint_password: "")


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
