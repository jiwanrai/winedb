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

ActiveRecord::Schema.define(version: 20140529084954) do

  create_table "appellations", force: true do |t|
    t.string  "name",         limit: 100
    t.string  "abbreviation", limit: 45,  null: false
    t.integer "country_id",               null: false
    t.string  "description",  limit: 500
  end

  create_table "consumed_wines", force: true do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.integer  "currency_id"
    t.integer  "price"
    t.string   "purchased_from"
    t.date     "date_consumed"
    t.string   "form"
    t.string   "review"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string "name",        limit: 100, null: false
    t.string "description", limit: 500
  end

  create_table "currencies", force: true do |t|
    t.string "name",   limit: 45
    t.string "symbol", limit: 45
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_wines", force: true do |t|
    t.integer "wine_id",  null: false
    t.integer "event_id", null: false
  end

  create_table "grapes", force: true do |t|
    t.string "name",        limit: 45
    t.string "description", limit: 500
  end

  create_table "grapes_wines", force: true do |t|
    t.integer "wine_id",  null: false
    t.integer "grape_id", null: false
  end

  create_table "prices", force: true do |t|
    t.string  "wine_id",     limit: 45,                         null: false
    t.decimal "amount",                 precision: 8, scale: 2
    t.string  "currency_id", limit: 45
  end

  create_table "regions", force: true do |t|
    t.integer "country_id",              null: false
    t.string  "name",        limit: 100, null: false
    t.string  "description", limit: 500
  end

  create_table "reviews", force: true do |t|
    t.integer "wine_id",                null: false
    t.string  "review",    limit: 1000
    t.float   "rating"
    t.boolean "buy_again"
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "users_wines", force: true do |t|
    t.integer "user_id", null: false
    t.integer "wine_id", null: false
  end

  create_table "wines", force: true do |t|
    t.string   "name",                 limit: 45,  null: false
    t.integer  "country_id"
    t.integer  "appellation_id"
    t.integer  "region_id"
    t.string   "link",                 limit: 500
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "vintage",              limit: 10
    t.text     "description"
  end

end
