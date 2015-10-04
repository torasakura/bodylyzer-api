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

ActiveRecord::Schema.define(version: 20151004191415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentication_tokens", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.datetime "last_used_at"
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "authentication_tokens", ["user_id"], name: "index_authentication_tokens_on_user_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "video_url"
    t.string   "unit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "exercises_trainingsdays", id: false, force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "trainingsday_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "exercises_trainingsdays", ["exercise_id"], name: "index_exercises_trainingsdays_on_exercise_id", using: :btree
  add_index "exercises_trainingsdays", ["trainingsday_id"], name: "index_exercises_trainingsdays_on_trainingsday_id", using: :btree

  create_table "trainingsdays", force: :cascade do |t|
    t.string   "weekday"
    t.integer  "workout_plan_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "trainingsdays", ["workout_plan_id"], name: "index_trainingsdays_on_workout_plan_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.integer  "sets"
    t.integer  "reps"
    t.decimal  "weight"
    t.integer  "feeling"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workout_exercises", ["exercise_id"], name: "index_workout_exercises_on_exercise_id", using: :btree
  add_index "workout_exercises", ["workout_id"], name: "index_workout_exercises_on_workout_id", using: :btree

  create_table "workout_plans", force: :cascade do |t|
    t.date     "start_day"
    t.date     "end_day"
    t.string   "name"
    t.integer  "number_of_trainingsdays"
    t.string   "goal"
    t.boolean  "public",                  default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.date     "day"
    t.integer  "trainingsday_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "workouts", ["trainingsday_id"], name: "index_workouts_on_trainingsday_id", using: :btree

  add_foreign_key "authentication_tokens", "users"
  add_foreign_key "trainingsdays", "workout_plans"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "workouts"
  add_foreign_key "workouts", "trainingsdays"
end
