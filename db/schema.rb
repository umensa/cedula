# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_17_110259) do

  create_table "mentors", force: :cascade do |t|
    t.string "mentor_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.string "participant_name"
    t.integer "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_participants_on_session_id"
  end

  create_table "participants_sessions", id: false, force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "session_id", null: false
    t.index ["participant_id"], name: "index_participants_sessions_on_participant_id"
    t.index ["session_id"], name: "index_participants_sessions_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "topic"
    t.integer "mentor_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentor_id"], name: "index_sessions_on_mentor_id"
  end

  add_foreign_key "participants", "sessions"
  add_foreign_key "sessions", "mentors"
end
