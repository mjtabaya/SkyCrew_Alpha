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

ActiveRecord::Schema.define(version: 20180711181945) do

  create_table "arsenals", force: :cascade do |t|
    t.integer "captain_id"
    t.integer "skyfarer_id"
    t.integer "weapon_id"
    t.boolean "equipped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captain_id", "weapon_id"], name: "index_arsenals_on_captain_id_and_weapon_id"
    t.index ["skyfarer_id", "weapon_id"], name: "index_arsenals_on_skyfarer_id_and_weapon_id"
  end

  create_table "captains", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skyfarers", force: :cascade do |t|
    t.integer "captain_id"
    t.string "name"
    t.string "race"
    t.string "profession"
    t.decimal "base_attack"
    t.decimal "base_defense"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "weapon_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
