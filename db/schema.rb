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

ActiveRecord::Schema.define(version: 20150914164130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "review_session_id"
    t.integer  "student_test_score"
    t.string   "status",             default: "assigned", null: false
    t.date     "date_assigned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "test_question_id"
    t.string  "choice_text"
    t.string  "choice_uid"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "test_question_id"
    t.integer  "student_id"
    t.string   "student_answer"
    t.integer  "student_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_questions", force: :cascade do |t|
    t.integer  "topic_id"
    t.string   "question_text"
    t.string   "question_uid"
    t.string   "answer_text"
    t.string   "answer_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",     default: true, null: false
  end

  create_table "review_sessions", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.string   "title",             null: false
    t.integer  "total_test_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name",                  null: false
    t.string   "last_name",                   null: false
    t.string   "email",                       null: false
    t.string   "password_digest"
    t.integer  "status",          default: 0, null: false
    t.string   "identification"
    t.integer  "grad_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name",                      null: false
    t.string   "last_name",                       null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "is_active",       default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false, null: false
  end

  create_table "test_questions", force: :cascade do |t|
    t.integer  "review_session_id"
    t.string   "question_text"
    t.string   "test_question_uid"
    t.integer  "points",            default: 1,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_active",         default: true, null: false
    t.integer  "correct_answer"
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "unit_id"
    t.string   "title",       null: false
    t.string   "description"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: :cascade do |t|
    t.integer  "review_session_id"
    t.string   "title",             null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
