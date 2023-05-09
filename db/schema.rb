# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20230509062238) do

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title",       limit: 255
    t.text     "discription", limit: 65535
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "discreption", limit: 65535
    t.integer  "student_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "blogs", ["student_id"], name: "index_blogs_on_student_id", using: :btree

  create_table "doctor_patients", force: :cascade do |t|
    t.integer  "doctor_id",  limit: 4
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "doctor_patients", ["doctor_id"], name: "index_doctor_patients_on_doctor_id", using: :btree
  add_index "doctor_patients", ["patient_id"], name: "index_doctor_patients_on_patient_id", using: :btree

  create_table "doctors", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.string   "contact_no",   limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "patient_name", limit: 255
    t.string   "gender",       limit: 255
    t.text     "city",         limit: 65535
    t.date     "dob"
  end

  create_table "live_classes", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "teacher",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "live_classes", ["user_id"], name: "index_live_classes_on_user_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.integer  "age",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "pname",       limit: 255
    t.string   "discription", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "role_discription", limit: 255
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
    t.integer "role_id", limit: 4, null: false
  end

  create_table "student_projects", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "project_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "student_projects", ["project_id"], name: "index_student_projects_on_project_id", using: :btree
  add_index "student_projects", ["student_id"], name: "index_student_projects_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "contact_no", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "email",         limit: 255
    t.string   "contact_no",    limit: 80
    t.string   "gender",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "country",       limit: 255
    t.string   "village",       limit: 255
    t.string   "role_id",       limit: 255
    t.datetime "date_of_birth"
  end

  add_foreign_key "blogs", "students"
  add_foreign_key "doctor_patients", "doctors"
  add_foreign_key "doctor_patients", "patients"
  add_foreign_key "live_classes", "users"
  add_foreign_key "student_projects", "projects"
  add_foreign_key "student_projects", "students"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
