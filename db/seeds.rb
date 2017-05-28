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

mac = Product.create!(name: 'MacBook Pro',
                      prize: 2199,
                      stock: 11,
                      description: 'The new MacBook Pro is faster and more powerful than before, yet remarkably thinner and lighter.1 It has the brightest, most colorful Mac notebook display ever. And it introduces the revolutionary Touch Bar—a Multi-Touch– enabled strip of glass built into the keyboard for instant access to what you want to do, when you want to do it. The new MacBook Pro is built on groundbreaking ideas. And it’s ready for yours.',
                      details: Faker::Lorem.paragraph)

mac.images = [
  Pathname.new(Rails.root + 'app/assets/images/products/macbookpro1.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/macbookpro2.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/macbookpro3.jpg').open
]
mac.save!

Category.create!(name: 'Notebook')
ProductCategory.create!(product_id: 1,
                        category_id: 1)

Category.create!(name: 'Apple',
                 parent_id: 1)
ProductCategory.create!(product_id: 1,
                        category_id: 2)

Category.create!(name: 'Misc')

Tag.create!(name: 'Apple')
ProductTag.create!(tag_id: 1,
                   product_id: 1)

Tag.create!(name: 'Mac')
ProductTag.create!(tag_id: 2,
                   product_id: 1)

Review.create!(content: 'Dis is beri gud',
               score: 4.3,
               user_id: 2,
               product_id: 1)

Review.create!(content: 'Mac is bad, i like Turing machines',
               score: 1.4,
               user_id: 3,
               product_id: 1)

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

echo = Product.create!(name: 'Echo',
                       prize: 179.99,
                       stock: 11,
                       description: 'Plays all your music from Amazon Music, Spotify, Pandora, iHeartRadio, TuneIn, and more using just your voice.',
                       details: Faker::Lorem.paragraph)

echo.images = [
  Pathname.new(Rails.root + 'app/assets/images/products/echo1.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/echo2.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/echo3.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/echo4.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/echo5.jpg').open
]
echo.save!

FireTVstick = Product.create!(name: 'Fire TV Stick',
                              prize: 39.99,
                              stock: 11,
                              description: 'The next generation of our bestselling Fire TV Stick. The most powerful streaming media stick under $50–now with the Alexa Voice Remote.',
                              details: Faker::Lorem.paragraph)

FireTVstick.images = [
  Pathname.new(Rails.root + 'app/assets/images/products/FireTVstick1.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/FireTVstick2.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/FireTVstick3.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/FireTVstick4.jpg').open
]

FireTVstick.save!

innogear = Product.create!(name: 'InnoGear HeadLamp',
                           prize: 39.99,
                           stock: 11,
                           description: 'Super Bright LED, max output up to 5000 lumen, powered by 2 pieces of rechargeable batteries(3.7v, 4400mAh).',
                           details: Faker::Lorem.paragraph)

innogear.images = [
  Pathname.new(Rails.root + 'app/assets/images/products/innogear1.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/innogear2.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/innogear3.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/innogear4.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/innogear5.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/innogear6.jpg').open,
  Pathname.new(Rails.root + 'app/assets/images/products/innogear7.jpg').open
]
innogear.save!

10.times do
  p = Product.create!(name: Faker::Commerce.product_name,
                      prize: Random.rand(1..10_000),
                      stock: Random.rand(10..20),
                      description: Faker::Lorem.paragraph(2),
                      details: Faker::Lorem.paragraph)

  ProductCategory.create!(product_id: p.id,
                          category_id: Random.rand(1..3))
end

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

Coupon.create!(code: '123123',
               discount: 10,
               redeems_available: 12,
               kind: :percentage)
CategoryCoupon.create!(category_id: 1,
                       coupon_id: 1)

# 20.times do
#   Review.create!(content: Faker::Lorem.paragraph,
#               score: Random.rand(0..5),
#               user_id: Random.rand(0..10),
#               product_id: Random.rand(0..10))
# end

Comment.create!(content: 'indeed, dis is beri beri good!',
                user_id: 2,
                review_id: 1)
