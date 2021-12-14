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

ActiveRecord::Schema.define(version: 2021_12_12_223759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
  end

  create_table "causes", force: :cascade do |t|
    t.string "title"
    t.string "story"
    t.date "start_date"
    t.date "end_date"
    t.string "reward"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "goal"
    t.index ["project_id"], name: "index_causes_on_project_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.bigint "user_id"
    t.bigint "cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_comments_on_cause_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.integer "amount"
    t.string "title"
    t.string "message"
    t.integer "status"
    t.string "code"
    t.string "payment_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "cause_id"
    t.index ["cause_id"], name: "index_donations_on_cause_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.string "industry"
    t.string "website"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "cause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "description"
    t.boolean "accomplished"
    t.index ["cause_id"], name: "index_reports_on_cause_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "surname"
    t.string "username"
    t.string "phone_number"
    t.string "address"
    t.bigint "category_id"
    t.bigint "user_type_id", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "causes", "projects"
  add_foreign_key "comments", "causes"
  add_foreign_key "comments", "users"
  add_foreign_key "donations", "causes"
  add_foreign_key "donations", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "reports", "causes"
end
