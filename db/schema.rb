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

ActiveRecord::Schema.define(version: 20131016081119) do

  create_table "banks", force: true do |t|
    t.string   "name"
    t.string   "branch"
    t.string   "type"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.string   "fax"
    t.string   "president"
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
    t.datetime "work_on"
    t.text     "content"
    t.string   "city"
    t.integer  "custom_id"
    t.boolean  "travel_expenses"
    t.boolean  "complete"
    t.integer  "invoice_id"
    t.integer  "estimate_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
