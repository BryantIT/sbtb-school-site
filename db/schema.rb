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

ActiveRecord::Schema.define(version: 2020_06_05_152138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "relationships", force: :cascade do |t|
    t.integer "student_id"
    t.integer "parent_id"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_relationships_on_parent_id"
    t.index ["student_id"], name: "index_relationships_on_student_id"
    t.index ["teacher_id"], name: "index_relationships_on_teacher_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.text "description"
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.integer "grade_level"
    t.string "email"
    t.text "about"
    t.string "password_digest"
    t.string "status"
    t.integer "role"
    t.uuid "authkey", default: -> { "uuid_generate_v4()" }
  end

end
