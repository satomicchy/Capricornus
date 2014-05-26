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

ActiveRecord::Schema.define(version: 20140526094209) do

  create_table "banks", force: true do |t|
    t.string   "name"
    t.string   "branch"
    t.string   "type"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_holder"
    t.integer  "company_id"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "fax"
    t.string   "zip"
    t.string   "email"
    t.integer  "close_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "costs", force: true do |t|
    t.integer  "count"
    t.string   "unit"
    t.integer  "unit_price"
    t.integer  "journal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customs", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "fax"
    t.string   "president"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "estimates", force: true do |t|
    t.string   "number"
    t.string   "title"
    t.date     "deadline"
    t.string   "requirement"
    t.integer  "custom_id"
    t.text     "memo"
    t.integer  "summary"
    t.boolean  "cancel"
    t.boolean  "fixed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.date     "ask_on"
    t.date     "deadline"
    t.integer  "custom_id"
    t.text     "memo"
    t.integer  "summary"
    t.boolean  "payment"
    t.boolean  "cancel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", force: true do |t|
    t.text     "content"
    t.string   "city"
    t.integer  "custom_id"
    t.boolean  "complete"
    t.integer  "invoice_id"
    t.integer  "estimate_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_at"
    t.datetime "finish_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
