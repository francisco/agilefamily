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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131212053131) do

  create_table "families", :force => true do |t|
    t.text     "mission_statement"
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.time     "meeting_time"
    t.string   "meeting_day"
  end

  create_table "family_members", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.integer  "age"
    t.integer  "family_id"
    t.string   "role"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "accepted"
  end

  add_index "family_members", ["email"], :name => "index_family_members_on_email", :unique => true
  add_index "family_members", ["reset_password_token"], :name => "index_family_members_on_reset_password_token", :unique => true

  create_table "task_logs", :force => true do |t|
    t.integer  "family_member_id"
    t.integer  "task_id"
    t.datetime "due_date"
    t.boolean  "complete"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "task_weekdays", :force => true do |t|
    t.integer  "task_id"
    t.integer  "weekday_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.text     "description"
    t.integer  "family_member_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "weekdays", :force => true do |t|
    t.string   "weekday"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
