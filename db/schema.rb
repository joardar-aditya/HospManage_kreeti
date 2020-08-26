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

ActiveRecord::Schema.define(version: 2020_08_26_085008) do

  create_table "appointments", force: :cascade do |t|
    t.date "Date"
    t.string "Time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "beds", force: :cascade do |t|
    t.string "name"
    t.integer "price_per_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "disease"
    t.boolean "admitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "bed_id"
    t.integer "payment_id"
    t.integer "staff_id"
    t.string "email"
    t.integer "genders_id"
    t.string "address"
    t.string "phone"
    t.date "dob"
    t.string "e_con_name"
    t.string "e_con_phone"
    t.string "e_con_email"
    t.string "status"
    t.index ["bed_id"], name: "index_patients_on_bed_id"
    t.index ["genders_id"], name: "index_patients_on_genders_id"
    t.index ["payment_id"], name: "index_patients_on_payment_id"
    t.index ["staff_id"], name: "index_patients_on_staff_id"
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
