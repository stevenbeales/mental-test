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

ActiveRecord::Schema.define(version: 20180306151658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessment_instruments", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["assessment_id", "instrument_id"], name: "index_assessment_instruments_on_assessment_id_and_instrument_id", unique: true
    t.index ["assessment_id"], name: "index_assessment_instruments_on_assessment_id"
    t.index ["instrument_id"], name: "index_assessment_instruments_on_instrument_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.integer "order_number", default: 1, null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["content"], name: "index_assessments_on_content", using: :gin
    t.index ["visit_id", "order_number"], name: "index_assessments_on_visit_id_and_order_number", unique: true
    t.index ["visit_id"], name: "index_assessments_on_visit_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "response_scale_id", null: false
    t.string "value", null: false
    t.integer "score", default: -1, null: false
    t.string "description", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["response_scale_id", "value"], name: "index_choices_on_response_scale_id_and_value", unique: true
    t.index ["response_scale_id"], name: "index_choices_on_response_scale_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_folders_on_name"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.string "version_number", default: "1.0", null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "tags", default: [], array: true
    t.index ["content"], name: "index_instruments_on_content", using: :gin
    t.index ["name"], name: "index_instruments_on_name", unique: true
    t.index ["tags"], name: "index_instruments_on_tags", using: :gin
  end

  create_table "items", force: :cascade do |t|
    t.bigint "instrument_id", null: false
    t.string "name", null: false
    t.string "item_type", null: false
    t.string "title", null: false
    t.bigint "response_scale_id"
    t.boolean "is_required", default: true, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["instrument_id"], name: "index_items_on_instrument_id"
    t.index ["name"], name: "index_items_on_name", unique: true
    t.index ["response_scale_id"], name: "index_items_on_response_scale_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "folder_id"
    t.string "title", null: false
    t.text "purpose"
    t.string "irb_number"
    t.string "grant_number"
    t.string "pi_firstname"
    t.string "pi_lastname"
    t.boolean "archived", default: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["folder_id"], name: "index_projects_on_folder_id"
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "response_scales", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_response_scales_on_name", unique: true
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "choice_id"
    t.string "value", default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["assessment_id"], name: "index_responses_on_assessment_id"
    t.index ["choice_id"], name: "index_responses_on_choice_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "study_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_schedules_on_name"
    t.index ["study_id"], name: "index_schedules_on_study_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["assessment_id", "name"], name: "index_scores_on_assessment_id_and_name", unique: true
    t.index ["assessment_id"], name: "index_scores_on_assessment_id"
    t.index ["name"], name: "index_scores_on_name"
  end

  create_table "studies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_studies_on_name"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "max_attempts", default: 0, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_surveys_on_name", unique: true
  end

  create_table "user_surveys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
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
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["preferences"], name: "index_users_on_preferences", using: :gin
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type"
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.string "name", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "visit_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["survey_id", "user_id", "name"], name: "index_visits_on_survey_id_and_user_id_and_name", unique: true
    t.index ["survey_id"], name: "index_visits_on_survey_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "assessment_instruments", "assessments"
  add_foreign_key "assessment_instruments", "instruments"
  add_foreign_key "assessments", "visits"
  add_foreign_key "choices", "response_scales"
  add_foreign_key "items", "instruments"
  add_foreign_key "items", "response_scales"
  add_foreign_key "responses", "assessments"
  add_foreign_key "schedules", "studies"
  add_foreign_key "scores", "assessments"
  add_foreign_key "user_surveys", "surveys"
  add_foreign_key "user_surveys", "users"
  add_foreign_key "visits", "surveys"
  add_foreign_key "visits", "users"
end
