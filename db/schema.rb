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

ActiveRecord::Schema.define(version: 2019_01_15_144854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "term_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_contestants_on_team_id"
    t.index ["term_id"], name: "index_contestants_on_term_id"
  end

  create_table "leaders", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_leaders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_leaders_on_reset_password_token", unique: true
  end

  create_table "scorings", force: :cascade do |t|
    t.integer "amount"
    t.bigint "task_id"
    t.string "scoreable_type"
    t.bigint "scoreable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scoreable_type", "scoreable_id"], name: "index_scorings_on_scoreable_type_and_scoreable_id"
    t.index ["task_id"], name: "index_scorings_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "completed_at"
    t.boolean "is_live", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "term_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term_id"], name: "index_teams_on_term_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contestants", "teams"
  add_foreign_key "contestants", "terms"
  add_foreign_key "scorings", "tasks"
  add_foreign_key "teams", "terms"
end
