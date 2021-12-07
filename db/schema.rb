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

ActiveRecord::Schema.define(version: 2021_12_07_020131) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "creation_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creation_id"], name: "index_comments_on_creation_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "creations", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "length"
    t.string "category"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_creations_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "creation_id"
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creation_id"], name: "index_donations_on_creation_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "flags", force: :cascade do |t|
    t.integer "user_id"
    t.integer "creation_id"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creation_id"], name: "index_flags_on_creation_id"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "lib_items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "creation_id"
    t.index ["creation_id"], name: "index_lib_items_on_creation_id"
    t.index ["user_id"], name: "index_lib_items_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "creation_id"
    t.index ["creation_id"], name: "index_likes_on_creation_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "taglinks", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "creation_id"
    t.index ["creation_id"], name: "index_taglinks_on_creation_id"
    t.index ["tag_id"], name: "index_taglinks_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
