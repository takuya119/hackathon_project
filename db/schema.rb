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

ActiveRecord::Schema[7.0].define(version: 2022_08_21_054900) do
  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "public_facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["public_facility_id"], name: "index_bookmarks_on_public_facility_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "event_comments", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.integer "event_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_comments_on_event_id"
    t.index ["user_id"], name: "index_event_comments_on_user_id"
  end

  create_table "event_replies", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.integer "event_comment_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_comment_id"], name: "index_event_replies_on_event_comment_id"
    t.index ["user_id"], name: "index_event_replies_on_user_id"
  end

  create_table "event_tags", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_tags_on_event_id"
    t.index ["tag_id"], name: "index_event_tags_on_tag_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.text "detail"
    t.integer "capacity"
    t.integer "status", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "facility_comments", force: :cascade do |t|
    t.string "name", null: false
    t.text "content", null: false
    t.integer "comment_type", default: 0, null: false
    t.integer "public_facility_id", null: false
    t.integer "room_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["public_facility_id"], name: "index_facility_comments_on_public_facility_id"
    t.index ["room_id"], name: "index_facility_comments_on_room_id"
    t.index ["user_id"], name: "index_facility_comments_on_user_id"
  end

  create_table "facility_replies", force: :cascade do |t|
    t.string "name", null: false
    t.text "content", null: false
    t.integer "facility_comment_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_comment_id"], name: "index_facility_replies_on_facility_comment_id"
    t.index ["user_id"], name: "index_facility_replies_on_user_id"
  end

  create_table "municipalities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "public_facilities", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "longitude", null: false
    t.string "latitude", null: false
    t.string "category", null: false
    t.string "reserve_url"
    t.integer "municipality_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["municipality_id"], name: "index_public_facilities_on_municipality_id"
    t.index ["user_id"], name: "index_public_facilities_on_user_id"
  end

  create_table "room_tags", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_tags_on_room_id"
    t.index ["tag_id"], name: "index_room_tags_on_tag_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "capacity"
    t.integer "public_facility_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["public_facility_id"], name: "index_rooms_on_public_facility_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "role", default: 0, null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "bookmarks", "public_facilities"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "event_comments", "events"
  add_foreign_key "event_comments", "users"
  add_foreign_key "event_replies", "event_comments"
  add_foreign_key "event_replies", "users"
  add_foreign_key "event_tags", "events"
  add_foreign_key "event_tags", "tags"
  add_foreign_key "events", "users"
  add_foreign_key "facility_comments", "public_facilities"
  add_foreign_key "facility_comments", "rooms"
  add_foreign_key "facility_comments", "users"
  add_foreign_key "facility_replies", "facility_comments"
  add_foreign_key "facility_replies", "users"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "users"
  add_foreign_key "public_facilities", "municipalities"
  add_foreign_key "public_facilities", "users"
  add_foreign_key "room_tags", "rooms"
  add_foreign_key "room_tags", "tags"
  add_foreign_key "rooms", "public_facilities"
end
