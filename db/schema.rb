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

ActiveRecord::Schema.define(version: 20180217164959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instruments", force: :cascade do |t|
    t.text "name", null: false
    t.jsonb "content", default: "{}", null: false
    t.index ["content"], name: "index_instruments_on_content", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.text "username", null: false
    t.text "firstname", null: false
    t.text "lastname", null: false
    t.jsonb "preferences", default: "{}", null: false
    t.index ["preferences"], name: "index_users_on_preferences", using: :gin
  end

end
