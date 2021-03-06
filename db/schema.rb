# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_02_143108) do

  create_table "carriers", force: :cascade do |t|
    t.string "name", null: false
    t.string "age", null: false
    t.boolean "has_driver_license_a", default: false
    t.boolean "has_driver_license_b", default: false
    t.boolean "has_driver_license_c", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "transporter_company_id"
  end

  create_table "geolocations", force: :cascade do |t|
    t.decimal "latitude"
    t.decimal "longitude"
    t.decimal "altitude"
    t.integer "carrier_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "post_codes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transporter_companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "siret", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["siret"], name: "index_transporter_companies_on_siret", unique: true
  end

  create_table "transporters_postcodes_relationships", force: :cascade do |t|
    t.integer "transporter_company_id"
    t.integer "post_code_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transporter_company_id", "post_code_id"], name: "transporters_postcodes_index", unique: true
  end

end
