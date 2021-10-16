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

ActiveRecord::Schema.define(version: 2021_10_16_153633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "type"
    t.bigint "film_epks_id"
    t.index ["film_epks_id"], name: "index_awards_on_film_epks_id"
  end

  create_table "film_epks", force: :cascade do |t|
    t.bigint "user_id"
    t.string "movie_title"
    t.string "genre"
    t.text "trailer"
    t.text "teaser"
    t.string "website"
    t.string "tag_line"
    t.string "log_line"
    t.string "movie_poster"
    t.text "synopsis"
    t.string "country"
    t.string "release_year"
    t.time "run_time"
    t.string "language"
    t.integer "budget"
    t.string "contact_name"
    t.string "contact_number"
    t.string "contact_email"
    t.string "company_name"
    t.string "production_company"
    t.string "distribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_film_epks_on_user_id"
  end

  create_table "film_fams", force: :cascade do |t|
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.text "image"
    t.string "description"
    t.bigint "film_epks_id"
    t.index ["film_epks_id"], name: "index_film_fams_on_film_epks_id"
  end

  create_table "presses", force: :cascade do |t|
    t.string "name_of_publication"
    t.string "description"
    t.string "link"
    t.bigint "film_epks_id"
    t.index ["film_epks_id"], name: "index_presses_on_film_epks_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "awards", "film_epks", column: "film_epks_id"
  add_foreign_key "film_epks", "users"
  add_foreign_key "film_fams", "film_epks", column: "film_epks_id"
  add_foreign_key "presses", "film_epks", column: "film_epks_id"
end
