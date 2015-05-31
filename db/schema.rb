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

ActiveRecord::Schema.define(version: 20150531165519) do

  create_table "event_signups", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "event_signups", ["event_id"], name: "index_event_signups_on_event_id"
  add_index "event_signups", ["user_id"], name: "index_event_signups_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "university_id"
    t.integer  "location_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "description"
    t.string   "organizer_contact_email"
    t.string   "address"
    t.integer  "creator_id"
  end

  add_index "events", ["creator_id"], name: "index_events_on_creator_id"
  add_index "events", ["location_id"], name: "index_events_on_location_id"
  add_index "events", ["university_id"], name: "index_events_on_university_id"

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.text   "description"
  end

  create_table "universities", force: :cascade do |t|
    t.string  "name"
    t.integer "location_id"
    t.text    "description"
    t.string  "logo_url"
  end

  add_index "universities", ["location_id"], name: "index_universities_on_location_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.integer  "university_id"
    t.integer  "graduation_year"
    t.string   "major"
    t.string   "bio"
    t.integer  "location_id"
    t.string   "interested_in_hosting"
    t.string   "interested_in_hanging_out"
    t.string   "name"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["location_id"], name: "index_users_on_location_id"
  add_index "users", ["university_id"], name: "index_users_on_university_id"

end
