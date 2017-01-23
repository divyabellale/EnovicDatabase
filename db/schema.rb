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

ActiveRecord::Schema.define(version: 20140925070608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "monthly_fee"
    t.integer  "total_fee"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fee_statuses", force: :cascade do |t|
    t.integer  "amount_paid"
    t.date     "paid_date"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "father_name"
    t.string   "student_type"
    t.string   "address1"
    t.integer  "phone"
    t.string   "email"
    t.date     "dob"
    t.string   "father_occupation"
    t.string   "fee_status"
    t.date     "date_of_admission"
    t.string   "course"
    t.string   "village"
    t.string   "post"
    t.string   "panchayat"
    t.string   "hobli"
    t.string   "taluq"
    t.string   "district"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
