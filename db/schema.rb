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

ActiveRecord::Schema.define(version: 2021_03_13_164156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collected_coins", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "value"
    t.index ["user_id"], name: "index_collected_coins_on_user_id"
  end

  create_table "deaths", force: :cascade do |t|
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_deaths_on_users_id"
  end

  create_table "killed_monsters", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "monsters_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["monsters_id"], name: "index_killed_monsters_on_monsters_id"
    t.index ["users_id"], name: "index_killed_monsters_on_users_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
