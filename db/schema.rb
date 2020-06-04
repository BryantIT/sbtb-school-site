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

ActiveRecord::Schema.define(version: 2020_06_04_140818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.string "email"
    t.text "about"
    t.string "password_digest"
    t.bigint "student_id"
    t.string "role", default: "parent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_parents_on_student_id"
  end

  create_table "principals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.string "email"
    t.text "about"
    t.string "password_digest"
    t.string "role", default: "principal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.datetime "start"
    t.datetime "end"
    t.text "description"
    t.integer "year"
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_schedules_on_student_id"
    t.index ["teacher_id"], name: "index_schedules_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.integer "age"
    t.integer "grade_level"
    t.string "email"
    t.text "about"
    t.string "password_digest"
    t.bigint "teacher_id"
    t.string "role", default: "student"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "enrolled"
    t.string "status"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_students_on_parent_id"
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial"
    t.string "email"
    t.text "about"
    t.string "password_digest"
    t.string "role", default: "teacher"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "enrolled"
    t.string "status"
  end

  create_table "years", force: :cascade do |t|
    t.string "name"
    t.integer "grade"
    t.bigint "teachers_id"
    t.bigint "students_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["students_id"], name: "index_years_on_students_id"
    t.index ["teachers_id"], name: "index_years_on_teachers_id"
  end

end
