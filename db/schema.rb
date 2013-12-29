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

ActiveRecord::Schema.define(version: 20131228031001) do

  create_table "av_devices", force: true do |t|
    t.string   "status"
    t.string   "asset_tag"
    t.string   "device"
    t.string   "location"
    t.string   "brand"
    t.string   "model"
    t.string   "serial_number"
    t.string   "value"
    t.string   "lease"
    t.string   "lease_term"
    t.string   "owner_or_teacher"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "key"
    t.string   "computer_name"
    t.string   "device_type"
    t.string   "assignment"
    t.string   "location"
    t.string   "change"
    t.date     "date_in_service"
    t.string   "asset_tag"
    t.string   "serial_number"
    t.string   "manufacturer"
    t.date     "disposal_date"
    t.string   "mac1"
    t.string   "mac2"
    t.string   "cpu"
    t.string   "ghz"
    t.string   "core"
    t.string   "hdd"
    t.string   "screen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "change_location"
  end

  create_table "idevices", force: true do |t|
    t.string   "device_type"
    t.string   "model_number"
    t.string   "capacity_hd"
    t.string   "serial_number"
    t.string   "asset_tag"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printers", force: true do |t|
    t.string   "printer"
    t.string   "location"
    t.string   "host_server"
    t.string   "ip_address"
    t.string   "win_7"
    t.string   "win_xp"
    t.string   "asset_tag"
    t.string   "serial_number"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timelines", force: true do |t|
    t.string   "device"
    t.date     "date_of_service"
    t.integer  "qty"
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
