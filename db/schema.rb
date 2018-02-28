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

ActiveRecord::Schema.define(version: 20180227035049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_instruments", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:25", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:25", null: false
    t.index ["assessment_id", "instrument_id"], name: "index_assessment_instruments_on_assessment_id_and_instrument_id", unique: true
    t.index ["assessment_id"], name: "index_assessment_instruments_on_assessment_id"
    t.index ["instrument_id"], name: "index_assessment_instruments_on_instrument_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.bigint "survey_id", null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:25", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:25", null: false
    t.index ["content"], name: "index_assessments_on_content", using: :gin
    t.index ["survey_id"], name: "index_assessments_on_survey_id"
    t.index ["visit_id"], name: "index_assessments_on_visit_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "rating_scale_id", null: false
    t.string "value", null: false
    t.integer "score", default: -1, null: false
    t.string "description", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
    t.index ["rating_scale_id", "value"], name: "index_choices_on_rating_scale_id_and_value", unique: true
    t.index ["rating_scale_id"], name: "index_choices_on_rating_scale_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
    t.index ["content"], name: "index_instruments_on_content", using: :gin
    t.index ["name"], name: "index_instruments_on_name", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.bigint "instrument_id", null: false
    t.string "name", null: false
    t.string "item_type", null: false
    t.string "title", null: false
    t.bigint "rating_scale_id"
    t.boolean "is_required", default: true, null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
    t.index ["instrument_id"], name: "index_items_on_instrument_id"
    t.index ["name"], name: "index_items_on_name", unique: true
    t.index ["rating_scale_id"], name: "index_items_on_rating_scale_id"
  end

  create_table "rating_scales", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
    t.index ["name"], name: "index_rating_scales_on_name", unique: true
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "choice_id"
    t.string "value", default: "", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:25", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:25", null: false
    t.index ["assessment_id"], name: "index_responses_on_assessment_id"
    t.index ["choice_id"], name: "index_responses_on_choice_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "max_attempts", default: 0, null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
  end

  create_table "user_surveys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
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
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
    t.index ["preferences"], name: "index_users_on_preferences", using: :gin
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type"
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.string "name", default: "2018-02-28 04:24:24.902913", null: false
    t.datetime "visit_date", default: "2018-02-28 04:24:24", null: false
    t.datetime "created_at", default: "2018-02-28 04:24:24", null: false
    t.datetime "updated_at", default: "2018-02-28 04:24:24", null: false
    t.index ["survey_id", "user_id", "name"], name: "index_visits_on_survey_id_and_user_id_and_name", unique: true
    t.index ["survey_id"], name: "index_visits_on_survey_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "assessment_instruments", "assessments"
  add_foreign_key "assessment_instruments", "instruments"
  add_foreign_key "assessments", "surveys"
  add_foreign_key "assessments", "visits"
  add_foreign_key "choices", "rating_scales"
  add_foreign_key "items", "instruments"
  add_foreign_key "items", "rating_scales"
  add_foreign_key "responses", "assessments"
  add_foreign_key "user_surveys", "surveys"
  add_foreign_key "user_surveys", "users"
  add_foreign_key "visits", "surveys"
  add_foreign_key "visits", "users"
end
