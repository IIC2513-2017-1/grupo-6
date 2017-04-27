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

ActiveRecord::Schema.define(version: 20170427211947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "score"
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer  "discount"
    t.integer  "redeems_available"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "type"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "status"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.index ["question_id"], name: "index_question_votes_on_question_id", using: :btree
    t.index ["user_id"], name: "index_question_votes_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "score"
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
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "password"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "question_votes", "questions"
  add_foreign_key "question_votes", "users"
  add_foreign_key "questions", "products"
  add_foreign_key "questions", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
