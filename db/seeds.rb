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

# Tenant.create(first_name: "nil", last_name: "nil", email: "niltenant@gmail.com", password: "nil", hint_password: "nil", contract_id: 1, unit_id: 1)
# Unit.create(name: "Unit has not been assigned", sector_id: 1)
# Sector.create(name: "Sector has not been assigned", property_id: 1)
# Property.create(name: "Tenant has not been assigned", admin_id: 1)
# Admin.create(first_name: "nil", last_name: "nil", email: "niladmin@gmail.com", password: "nil", hint_password: "nil")

Tenant.create(first_name: "mike", last_name: "mike", email: "mike@mike.com", password: "123", hint_password: "hi there", contract_id: rand(2..16), unit_id: 2)
Tenant.create(first_name: "Rog", last_name: "tenant", email: "tenant@gmail.com", password: "111", hint_password: "hi there", contract_id: rand(2..16), unit_id: 2)
Admin.create(first_name: "roger", last_name: "roger", email: "r@r.com", password: "111", hint_password: "hi there")
Admin.create(first_name: "Roger", last_name: "Perez", email: "roger@gmail.com", password: "111", hint_password: "hi there")
3.times do
  Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8), hint_password: "hi there")
end

2.times do
  3.times do |i|
    Property.create(name: Faker::Address.community, description: Faker::SiliconValley.quote, admin_id: i+1)
  end
end

2.times do
  6.times do |i|
    Sector.create(name: Faker::Number.between(1, 25), property_id: i+1)
  end
end

2.times do
  12.times do |i|
    Unit.create(name: Faker::Number.between(1, 100), sector_id: i+1)
  end
end

2.times do
  24.times do |i|
    Tenant.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8), hint_password: "hi there", contract_id: rand(1..16), unit_id: i+1)
  end
end


Unit.create(name: Faker::Number.between(1, 100), sector_id: 1)
Unit.create(name: Faker::Number.between(1, 100), sector_id: 2)
Unit.create(name: Faker::Number.between(1, 100), sector_id: 3)
Unit.create(name: Faker::Number.between(1, 100), sector_id: 4)
Unit.create(name: Faker::Number.between(1, 100), sector_id: 5)
Unit.create(name: Faker::Number.between(1, 100), sector_id: 6)
Unit.create(name: Faker::Number.between(1, 100), sector_id: 7)


# puts Tenant.create(first_name: "Ian", last_name: "Pollack", email: "ian@email.com", password: "password", hint_password: "self")

# puts Unit.create(name: "Marshall Hill Apartments")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
