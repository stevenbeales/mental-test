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

ActiveRecord::Schema.define(version: 2018_04_22_022448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arms", comment: "Arms table", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", default: 1, null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_arms_on_name"
    t.index ["number"], name: "index_arms_on_number"
    t.index ["schedule_id", "id", "name"], name: "index_by_schedule_name", unique: true
    t.index ["schedule_id", "id", "number"], name: "index_by_schedule_number", unique: true
    t.index ["schedule_id"], name: "index_arms_on_schedule_id"
  end

  create_table "assessment_instruments", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["assessment_id", "instrument_id"], name: "index_by_assessment_instrument", unique: true
    t.index ["assessment_id"], name: "index_assessment_instruments_on_assessment_id"
    t.index ["instrument_id"], name: "index_assessment_instruments_on_instrument_id"
  end

  create_table "assessments", comment: "Assessments table", force: :cascade do |t|
    t.bigint "visit_id", null: false
    t.integer "order_number", default: 1, null: false
    t.jsonb "content", default: "{}", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["content"], name: "assessment_content", using: :gin
    t.index ["visit_id", "order_number"], name: "index_by_visit_order_number", unique: true
    t.index ["visit_id"], name: "index_assessments_on_visit_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "choices", comment: "Choices table", force: :cascade do |t|
    t.bigint "response_scale_id", null: false
    t.string "value", null: false
    t.integer "score", default: -1, null: false
    t.string "description", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["response_scale_id", "value"], name: "index_by_response_scale_value", unique: true
    t.index ["response_scale_id"], name: "index_choices_on_response_scale_id"
  end

  create_table "data_migrations", force: :cascade do |t|
    t.string "version"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_folders_on_name"
  end

  create_table "instruments", comment: "Instruments table", force: :cascade do |t|
    t.string "name", null: false
    t.string "version_number", default: "1.0", null: false
    t.string "instrument_type", default: "json", null: false
    t.jsonb "json_content", default: "{}", null: false
    t.text "csv_content", default: "", null: false
    t.text "instructions", default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["csv_content"], name: "index_instruments_on_csv_content"
    t.index ["discarded_at"], name: "index_instruments_on_discarded_at"
    t.index ["json_content"], name: "instrument_json_content", using: :gin
    t.index ["name", "version_number"], name: "index_instruments_on_name_and_version_number", unique: true
    t.index ["name"], name: "index_instruments_on_name"
  end

  create_table "items", comment: "Items table", force: :cascade do |t|
    t.bigint "instrument_id", null: false
    t.string "name", null: false
    t.string "item_type", null: false
    t.string "title", null: false
    t.bigint "response_scale_id"
    t.boolean "is_required", default: true, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_items_on_discarded_at"
    t.index ["instrument_id"], name: "index_items_on_instrument_id"
    t.index ["name"], name: "index_by_item_name", unique: true
    t.index ["response_scale_id"], name: "index_items_on_response_scale_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.bigint "journal_id", null: false
    t.datetime "entry_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "entry", default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["entry_date"], name: "index_journal_entries_on_entry_date"
    t.index ["journal_id"], name: "index_journal_entries_on_journal_id"
  end

  create_table "journals", comment: "Journals table", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_journals_on_name"
    t.index ["participant_id"], name: "index_journals_on_participant_id"
  end

  create_table "participants", comment: "Participants table", force: :cascade do |t|
    t.string "email", null: false
    t.string "identifier"
    t.bigint "user_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "index_participants_on_email"
    t.index ["identifier"], name: "index_participants_on_identifier"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "projects", comment: "Projects table", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "folder_id"
    t.string "title", null: false
    t.text "purpose"
    t.string "irb_number"
    t.string "grant_number"
    t.string "pi_firstname"
    t.string "pi_lastname"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "status", default: 0
    t.index ["folder_id"], name: "index_projects_on_folder_id"
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "response_scales", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_response_scales_on_name"
  end

  create_table "responses", comment: "Responses table", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.bigint "choice_id"
    t.string "value", default: "", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["assessment_id"], name: "index_responses_on_assessment_id"
    t.index ["choice_id"], name: "index_responses_on_choice_id"
  end

  create_table "schedules", comment: "Schedules table", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "study_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_schedules_on_name"
    t.index ["study_id"], name: "index_schedules_on_study_id"
  end

  create_table "scores", comment: "Scores table", force: :cascade do |t|
    t.bigint "assessment_id", null: false
    t.string "name", null: false
    t.integer "score", default: 0, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["assessment_id", "name"], name: "index_by_assessment_name", unique: true
    t.index ["assessment_id"], name: "index_scores_on_assessment_id"
    t.index ["name"], name: "index_scores_on_name"
  end

  create_table "studies", comment: "Studies table", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_studies_on_name"
  end

  create_table "study_event_instruments", force: :cascade do |t|
    t.bigint "study_event_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["instrument_id"], name: "index_study_event_instruments_on_instrument_id"
    t.index ["study_event_id", "instrument_id"], name: "index_by_study_event_instrument", unique: true
    t.index ["study_event_id"], name: "index_study_event_instruments_on_study_event_id"
  end

  create_table "study_events", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order", default: 1, null: false
    t.bigint "arm_id", null: false
    t.datetime "event_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["arm_id", "name"], name: "index_by_arm_name", unique: true
    t.index ["arm_id"], name: "index_study_events_on_arm_id"
    t.index ["name"], name: "index_study_events_on_name"
    t.index ["order"], name: "index_study_events_on_order"
  end

  create_table "study_participants", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "study_id", null: false
    t.string "subject_number"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["participant_id", "study_id"], name: "index_participant_study", unique: true
    t.index ["participant_id"], name: "index_study_participants_on_participant_id"
    t.index ["study_id", "subject_number"], name: "index_study_subject_number"
    t.index ["study_id"], name: "index_study_participants_on_study_id"
  end

  create_table "survey_participants", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "survey_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["participant_id", "survey_id"], name: "index_by_participant_survey", unique: true
    t.index ["participant_id"], name: "index_survey_participants_on_participant_id"
    t.index ["survey_id"], name: "index_survey_participants_on_survey_id"
  end

  create_table "surveys", comment: "Surveys table", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_active", default: true, null: false
    t.integer "max_attempts", default: 0, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["name"], name: "index_by_survey_name", unique: true
  end

  create_table "users", comment: "Users table", force: :cascade do |t|
    t.string "username", null: false
    t.string "firstname"
    t.string "lastname"
    t.text "access_token", default: "", null: false
    t.jsonb "preferences", default: "{}", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
    t.index ["preferences"], name: "preferences", using: :gin
    t.index ["username"], name: "username", unique: true
  end

  create_table "visits", comment: "Visits table", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.string "name"
    t.integer "number", default: 1, null: false
    t.datetime "visit_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["survey_id", "user_id", "number"], name: "index_by_survey_user_number", unique: true
    t.index ["survey_id"], name: "index_visits_on_survey_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "arms", "schedules"
  add_foreign_key "assessment_instruments", "assessments"
  add_foreign_key "assessment_instruments", "instruments"
  add_foreign_key "assessments", "visits"
  add_foreign_key "choices", "response_scales"
  add_foreign_key "items", "instruments"
  add_foreign_key "items", "response_scales"
  add_foreign_key "journal_entries", "journals"
  add_foreign_key "journals", "participants"
  add_foreign_key "responses", "assessments"
  add_foreign_key "schedules", "studies"
  add_foreign_key "study_event_instruments", "instruments"
  add_foreign_key "study_event_instruments", "study_events"
  add_foreign_key "study_events", "arms"
  add_foreign_key "study_participants", "participants"
  add_foreign_key "study_participants", "studies"
  add_foreign_key "survey_participants", "participants"
  add_foreign_key "survey_participants", "surveys"
  add_foreign_key "visits", "surveys"
  add_foreign_key "visits", "users"
end
