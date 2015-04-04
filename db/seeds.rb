# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

10.times do User.create(name: Faker::Name.name, email: Faker::Internet.email,
  password: Faker::Internet.password(8))
end

user_seed_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Kudotype.create(name: "Passion")
Kudotype.create(name: "Teamwork")
Kudotype.create(name: "Above and beyond")
Kudotype.create(name: "Innovation")
Kudotype.create(name: "Creativity")
Kudotype.create(name: "Expertise")
Kudotype.create(name: "Customer Service")

kudotype_seed_array = [1, 2, 3, 4, 5, 6]

10.times do

giver_seed = user_seed_array.sample
receiver_seed = user_seed_array[giver_seed -2]

kudotype_seed1 = kudotype_seed_array.sample
kudotype_seed2 = kudotype_seed_array[kudotype_seed1 - 2]

Kudo.create(giver_id: giver_seed,
  receiver_id: receiver_seed,
  comments: Faker::Lorem.sentence(2),
  kudotype_ids: [kudotype_seed1, kudotype_seed2])
end