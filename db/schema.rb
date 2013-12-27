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

ActiveRecord::Schema.define(version: 20131226041820) do

  create_table "av_interactives", force: true do |t|
    t.string   "brand"
    t.string   "device_type"
    t.string   "location"
    t.string   "model"
    t.string   "asset_tag"
    t.string   "serial_no"
    t.string   "status"
    t.string   "value"
    t.text     "lease"
    t.text     "lease_term"
    t.string   "owner"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "computer_timelines", force: true do |t|
    t.string   "device"
    t.date     "date_of_service"
    t.integer  "qty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.text     "name"
    t.text     "brand"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "device_type"
    t.string   "assignment"
    t.string   "location"
    t.string   "change_location"
    t.date     "date_in_service"
    t.string   "asset_tag"
    t.string   "serial_no"
    t.date     "disposal_date"
    t.string   "mac1"
    t.string   "mac2"
    t.string   "cpu"
    t.integer  "ghz"
    t.string   "core"
    t.string   "hdd"
    t.string   "screen"
  end

  create_table "idevices", force: true do |t|
    t.string   "name"
    t.string   "device_type"
    t.string   "model_number"
    t.string   "hd_capacity"
    t.string   "serial_no"
    t.string   "asset_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printers", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "host"
    t.string   "ip_address"
    t.string   "win7"
    t.string   "winxp"
    t.string   "asset_tag"
    t.string   "serial_number"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
