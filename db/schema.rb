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

ActiveRecord::Schema.define(version: 2021_12_03_025029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
  end

  create_table "cause_points", force: :cascade do |t|
    t.integer "goal"
    t.bigint "cause_id"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cause_id"], name: "index_cause_points_on_cause_id"
    t.index ["point_id"], name: "index_cause_points_on_point_id"
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

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.float "price"
    t.bigint "order_id"
    t.bigint "point_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["point_id"], name: "index_order_items_on_point_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.float "total"
    t.string "state"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "state"
    t.float "total"
    t.string "token"
    t.bigint "order_id"
    t.bigint "payment_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
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
    t.index ["category_id"], name: "index_users_on_category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "cause_points", "causes"
  add_foreign_key "cause_points", "points"
  add_foreign_key "causes", "projects"
  add_foreign_key "comments", "causes"
  add_foreign_key "comments", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "points"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "payments", "payment_methods"
  add_foreign_key "projects", "users"
  add_foreign_key "reports", "causes"
end
