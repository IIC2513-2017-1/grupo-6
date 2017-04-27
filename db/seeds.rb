# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: Faker::StarWars.character,
             email: 'orrios@uc.cl',
             username: Faker::Internet.user_name,
             last_name: Faker::StarWars.specie,
             phone_number: Faker::PhoneNumber.cell_phone,
             is_admin: true,
             address: Faker::StarWars.wookie_sentence,
             password: '123456')

5.times do
  User.create!(name: Faker::StarWars.character,
               email: Faker::Internet.unique.email,
               username: Faker::Internet.user_name,
               last_name: Faker::StarWars.specie,
               phone_number: Faker::PhoneNumber.cell_phone,
               is_admin: true,
               address: Faker::StarWars.wookie_sentence,
               password: '123456')
end

Product.create!(name: 'Notebook',
                prize: 500,
                stock: 3,
                description: Faker::Lorem.paragraph(2),
                details: Faker::Lorem.paragraph)

5.times do
  Product.create!(name: Faker::Commerce.product_name,
                  prize: Random.rand(1..10_000),
                  stock: Random.rand(10..20),
                  description: Faker::Lorem.paragraph(2),
                  details: Faker::Lorem.paragraph)
end

fact = Faker::ChuckNorris.fact[0...-1]

Question.create!(content: "is it true that #{fact}?",
                 user_id: 1,
                 product_id: 1)

QuestionVote.create!(user_id: 1,
                     question_id: 1,
                     delta: 1)

QuestionVote.create!(user_id: 2,
                     question_id: 1,
                     delta: -1)

QuestionVote.create!(user_id: 3,
                     question_id: 1,
                     delta: -1)

Answer.create!(content: "yes, its true that #{fact}",
               question_id: 1,
               user_id: 1)

AnswerVote.create!(user_id: 1,
                   answer_id: 1,
                   delta: 1)

AnswerVote.create!(user_id: 2,
                   answer_id: 1,
                   delta: 1)

AnswerVote.create!(user_id: 3,
                   answer_id: 1,
                   delta: -1)

Order.create!(user_id: 1,
              status: :processing)

OrderedProduct.create!(order_id: 1,
                        product_id: 1,
                        quantity: 5)
