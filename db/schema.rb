# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_10_30_023654) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.binary "category_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chats", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "goods_review_id"
    t.integer "user_id"
    t.integer "evaluation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goods_reviews", force: :cascade do |t|
    t.string "title"
    t.binary "review_image"
    t.text "review"
    t.integer "evaluation"
    t.integer "price"
    t.integer "category_id"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goods_comments", force: :cascade do |t|
    t.string "comment"
    t.integer "goods_review_id"
    t.integer "user_id"
    t.integer "evaluation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "goods_reviews", force: :cascade do |t|
    t.string "title"
    t.binary "review_image"
    t.text "review"
    t.integer "evaluation"
    t.integer "price"
    t.integer "category_id"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.binary "group_image"
    t.text "introduction"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "message"
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "select_categories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "store_comments", force: :cascade do |t|
    t.string "comment"
    t.integer "store_review_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "store_reviews", force: :cascade do |t|
    t.string "title"
    t.binary "review_image"
    t.text "review"
    t.integer "evaluation"
    t.string "spot"
    t.string "tell"
    t.integer "category_id"
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.string "occupation_id"
    t.binary "profile_image"
    t.integer "gender"
    t.text "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
