# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "friendlists", force: :cascade do |t|
    t.integer "friend_id"
    t.integer "requester_id"
  end

  add_index "friendlists", ["friend_id"], name: "index_friendlists_on_friend_id"
  add_index "friendlists", ["requester_id"], name: "index_friendlists_on_requester_id"

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
  end

  create_table "universities", force: :cascade do |t|
    t.string "name"
    t.string "color"
  end

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "password"
    t.integer "university_id"
    t.integer "graduation_year"
    t.string  "major"
    t.string  "bio"
    t.integer "location_id"
    t.string  "interested_in_hosting"
    t.string  "interested_in_hanging_out"
    t.string  "name"
  end

  add_index "users", ["location_id"], name: "index_users_on_location_id"
  add_index "users", ["university_id"], name: "index_users_on_university_id"

end
