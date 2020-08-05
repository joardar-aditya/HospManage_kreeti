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

ActiveRecord::Schema.define(version: 2020_08_05_110627) do

  create_table "beds", force: :cascade do |t|
    t.string "name"
    t.integer "price_per_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hosp_admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "name"
    t.string "password_digest"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "disease"
    t.boolean "admitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "beds_id"
    t.integer "payments_id"
    t.integer "staffs_id"
    t.index ["beds_id"], name: "index_patients_on_beds_id"
    t.index ["payments_id"], name: "index_patients_on_payments_id"
    t.index ["staffs_id"], name: "index_patients_on_staffs_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "paymenttype"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.boolean "reset"
    t.string "designation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "access"
    t.boolean "f_pass"
    t.boolean "doctor"
    t.boolean "admin"
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

end
