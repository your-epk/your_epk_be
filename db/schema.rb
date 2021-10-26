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

ActiveRecord::Schema.define(version: 2021_10_26_154633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "awards", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "award_type"
    t.bigint "film_epk_id"
    t.index ["film_epk_id"], name: "index_awards_on_film_epk_id"
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
    t.text "synopsis"
    t.string "country"
    t.string "release_year"
    t.string "run_time"
    t.string "language"
    t.string "budget"
    t.string "contact_name"
    t.string "contact_number"
    t.string "contact_email"
    t.string "company_name"
    t.string "production_company"
    t.string "distribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "header_image_description"
    t.index ["user_id"], name: "index_film_epks_on_user_id"
  end

  create_table "film_fams", force: :cascade do |t|
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.bigint "film_epk_id"
    t.index ["film_epk_id"], name: "index_film_fams_on_film_epk_id"
  end

  create_table "presses", force: :cascade do |t|
    t.string "name_of_publication"
    t.string "description"
    t.string "link"
    t.bigint "film_epk_id"
    t.index ["film_epk_id"], name: "index_presses_on_film_epk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "awards", "film_epks"
  add_foreign_key "film_epks", "users"
  add_foreign_key "film_fams", "film_epks"
  add_foreign_key "presses", "film_epks"
end
