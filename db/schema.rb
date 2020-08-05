
ActiveRecord::Schema.define(version: 2020_08_05_200843) do

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
    t.integer "bed_id"
    t.integer "payment_id"
    t.integer "staff_id"
    t.index ["bed_id"], name: "index_patients_on_bed_id"
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
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

end
