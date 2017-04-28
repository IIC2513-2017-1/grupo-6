# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170428232202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_votes", force: :cascade do |t|
    t.integer  "delta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "answer_id"
    t.index ["answer_id"], name: "index_answer_votes_on_answer_id", using: :btree
    t.index ["user_id", "answer_id"], name: "index_answer_votes_on_user_id_and_answer_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_answer_votes_on_user_id", using: :btree
  end

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "category_coupons", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "coupon_id"
    t.index ["category_id"], name: "index_category_coupons_on_category_id", using: :btree
    t.index ["coupon_id"], name: "index_category_coupons_on_coupon_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "review_id"
    t.index ["review_id"], name: "index_comments_on_review_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.integer  "kind"
    t.integer  "discount"
    t.integer  "redeems_available"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["code"], name: "index_coupons_on_code", unique: true, using: :btree
  end

  create_table "ordered_products", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.integer  "product_id"
    t.index ["order_id", "product_id"], name: "index_ordered_products_on_order_id_and_product_id", unique: true, using: :btree
    t.index ["order_id"], name: "index_ordered_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_ordered_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "status"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "product_categories", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "product_id"
    t.index ["category_id"], name: "index_product_categories_on_category_id", using: :btree
    t.index ["product_id"], name: "index_product_categories_on_product_id", using: :btree
  end

  create_table "product_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tag_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_product_tags_on_product_id", using: :btree
    t.index ["tag_id"], name: "index_product_tags_on_tag_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "details"
    t.integer  "prize"
    t.integer  "stock"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "question_votes", force: :cascade do |t|
    t.integer  "delta"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.index ["question_id"], name: "index_question_votes_on_question_id", using: :btree
    t.index ["user_id", "question_id"], name: "index_question_votes_on_user_id_and_question_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_question_votes_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_questions_on_product_id", using: :btree
    t.index ["user_id"], name: "index_questions_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.float    "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.index ["product_id"], name: "index_reviews_on_product_id", using: :btree
    t.index ["user_id", "product_id"], name: "index_reviews_on_user_id_and_product_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone_number"
    t.boolean  "is_admin"
    t.string   "password"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "answer_votes", "answers"
  add_foreign_key "answer_votes", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "category_coupons", "categories"
  add_foreign_key "category_coupons", "coupons"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "ordered_products", "orders"
  add_foreign_key "ordered_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_categories", "categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_tags", "tags"
  add_foreign_key "question_votes", "questions"
  add_foreign_key "question_votes", "users"
  add_foreign_key "questions", "products"
  add_foreign_key "questions", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
