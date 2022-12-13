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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_000832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "migranes", force: :cascade do |t|
    t.datetime "migrane_date"
    t.string "severity"
    t.text "notes"
    t.text "medications", default: "None", null: false
    t.text "symptoms", default: "None", null: false
    t.text "triggers", default: "None", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_migranes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "menstruator"
    t.string "meds_list"
    t.string "triggers_list"
    t.string "symptoms_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "migranes", "users"
end
