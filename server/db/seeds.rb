# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
things = %w{ Desk Chair Banana Thermos Herbert Dog }

user = User.create!(name: "test user", email: "test@email.com", password: "password")

5.times do |thing|
  Thing.create!(name: things.sample, description: "This is description ##{thing + 1}")
end