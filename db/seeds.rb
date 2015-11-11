# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


['registered', 'banned', 'moderator', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.delete_all
User.create!(email: "S.Osborne1992@gmail.com", username: "Osborne1992", first_name: "Simon", last_name: "Osborne", password: "password", password_confirmation: "password", role_id: 4)
User.create!(email: "SRC_Osborne1992@hotmail.co.uk", username: "Ossy", first_name: "Simon", last_name: "Osborne", password: "password", password_confirmation: "password", role_id: 4)
User.create!(email: "Osinaut@gmail.com", username: "Osinaut", first_name: "Simon", last_name: "Osborne", password: "password", password_confirmation: "password", role_id: 4)
User.create!(email: "Osbot@simonosborne.co.uk", username: "SkyNET", first_name: "Skye", last_name: "Nethaniel", password: "password", password_confirmation: "password", role_id: 1)