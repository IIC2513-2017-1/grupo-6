# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
    User.create!(name: Faker::StarWars.character, 
             email: Faker::Internet.unique.email,
             username: Faker::Internet.user_name,
             last_name: Faker::StarWars.species,
             phone_number: Faker::PhoneNumber.cell_phone,
             is_admin: true,
             address: Faker::StarWars.wookie_sentence,
             password: "123456",
            ) 
end

User.create!(name: Faker::StarWars.character, 
             email: "orrios@uc.cl",
             username: Faker::Internet.user_name,
             last_name: Faker::StarWars.species,
             phone_number: Faker::PhoneNumber.cell_phone,
             is_admin: true,
             address: Faker::StarWars.wookie_sentence,
             password: "123456",
            ) 