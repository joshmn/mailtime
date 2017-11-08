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

ActiveRecord::Schema.define(version: 20171107210923) do

  create_table "mailtime_layouts", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailtime_logs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "mailer_class"
    t.string   "mailer_method"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "mailtime_logs", ["mailer_class"], name: "index_mailtime_logs_on_mailer_class"
  add_index "mailtime_logs", ["mailer_method"], name: "index_mailtime_logs_on_mailer_method"
  add_index "mailtime_logs", ["user_id"], name: "index_mailtime_logs_on_user_id"

  create_table "mailtime_templates", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "layout_id"
  end

  add_index "mailtime_templates", ["layout_id"], name: "index_mailtime_templates_on_layout_id"

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "account_users", force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
  end

  add_index "account_users", ["account_id", "user_id"], name: "index_account_users_on_account_id_and_user_id"

end
