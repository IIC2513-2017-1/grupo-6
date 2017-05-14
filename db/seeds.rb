# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

User.create!(name: Faker::StarWars.character,
            email: 'orrios@uc.cl',
            username: Faker::Internet.user_name,
            last_name: Faker::StarWars.specie,
            phone_number: '95687485',
            is_admin: true,
            address: Faker::StarWars.wookie_sentence,
            password: '123456')

10.times do
  User.create!(name: Faker::StarWars.character,
              email: Faker::Internet.unique.email,
              username: Faker::Internet.user_name,
              last_name: Faker::StarWars.specie,
              phone_number: '95687485',
              is_admin: false,
              address: Faker::StarWars.wookie_sentence,
              password: '123456')
end

Product.create!(name: 'Notebook',
               prize: 500,
               stock: 3,
               description: Faker::Lorem.paragraph(2),
               details: Faker::Lorem.paragraph)

10.times do
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

Tag.create!(name: 'this is a tag')
ProductTag.create!(tag_id: 1,
                  product_id: 1)

Category.create!(name: 'pizza')
ProductCategory.create!(product_id: 1,
                       category_id: 1)

Category.create!(name: 'Hawaiiana',
                parent_id: 1)
Coupon.create!(code: '123123',
              discount: 10,
              redeems_available: 12,
              kind: :percentage)
CategoryCoupon.create!(category_id: 1,
                      coupon_id: 1)

Review.create!(content: 'dis is beri gud',
              score: 3.3,
              user_id: 1,
              product_id: 1)

# 20.times do
#   Review.create!(content: Faker::Lorem.paragraph,
#               score: Random.rand(0..5),
#               user_id: Random.rand(0..10),
#               product_id: Random.rand(0..10))
# end

Comment.create!(content: 'indeed, dis is beri beri good!',
               user_id: 2,
               review_id: 1)
