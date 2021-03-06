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

ActiveRecord::Schema.define(version: 20150624003355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.text     "location"
    t.string   "clienttype"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_games", force: :cascade do |t|
    t.integer "client_id"
    t.integer "game_id"
  end

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.text     "highscore"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "resetscores", default: true
  end

  create_table "games_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "highscores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "rank"
    t.integer  "highestscore"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.boolean  "admin"
    t.string   "location"
    t.integer  "coins",           default: 0
    t.float    "lat"
    t.float    "lon"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "ip_address"
  end

  create_table "users_vouchers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "voucher_id"
  end

  create_table "vouchers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "expiry"
    t.integer  "client_id"
    t.text     "textstuff"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
