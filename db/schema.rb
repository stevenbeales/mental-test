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

ActiveRecord::Schema.define(version: 20180223042846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.bigint "instrument_id", null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: "2018-02-22 00:00:00", null: false
    t.datetime "updated_at", default: "2018-02-22 00:00:00", null: false
    t.index ["content"], name: "index_assessments_on_content", using: :gin
    t.index ["instrument_id"], name: "index_assessments_on_instrument_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: "2018-02-22 00:00:00", null: false
    t.datetime "updated_at", default: "2018-02-22 00:00:00", null: false
    t.index ["content"], name: "index_instruments_on_content", using: :gin
    t.index ["name"], name: "index_instruments_on_name", unique: true
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "assessment_id", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "max_attempts", default: 0, null: false
    t.datetime "created_at", default: "2018-02-22 00:00:00", null: false
    t.datetime "updated_at", default: "2018-02-22 00:00:00", null: false
    t.index ["assessment_id"], name: "index_surveys_on_assessment_id"
  end

  create_table "user_surveys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.index ["survey_id"], name: "index_user_surveys_on_survey_id"
    t.index ["user_id", "survey_id"], name: "index_user_surveys_on_user_id_and_survey_id", unique: true
    t.index ["user_id"], name: "index_user_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "firstname"
    t.string "lastname"
    t.text "access_token", default: "", null: false
    t.jsonb "preferences", default: "{}", null: false
    t.datetime "created_at", default: "2018-02-22 00:00:00", null: false
    t.datetime "updated_at", default: "2018-02-22 00:00:00", null: false
    t.index ["preferences"], name: "index_users_on_preferences", using: :gin
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "assessments", "instruments"
  add_foreign_key "surveys", "assessments"
end
