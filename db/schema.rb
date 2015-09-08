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

ActiveRecord::Schema.define(version: 20150907085219) do

  create_table "channel_types", force: :cascade do |t|
    t.string   "channel_type_name", limit: 128
    t.datetime "create_at"
    t.datetime "update_at"
  end

  create_table "channels", force: :cascade do |t|
    t.string   "channel_name",    limit: 128
    t.integer  "parent_id",       limit: 4
    t.integer  "channel_type_id", limit: 4
    t.datetime "create_at"
    t.datetime "update_at"
    t.integer  "create_time_at",  limit: 4
    t.integer  "update_time_at",  limit: 4
  end

  create_table "contents", force: :cascade do |t|
    t.integer  "category_id",           limit: 4
    t.integer  "uid",                   limit: 4
    t.string   "title",                 limit: 512
    t.string   "summary",               limit: 512
    t.text     "description",           limit: 65535
    t.string   "images",                limit: 512
    t.string   "thumbnail",             limit: 512
    t.string   "video",                 limit: 255
    t.integer  "status",                limit: 4
    t.datetime "publish_date_at"
    t.datetime "unpublish_date_at"
    t.integer  "unpublish_date_status", limit: 4
    t.string   "tag",                   limit: 255
    t.string   "keyword",               limit: 255
    t.integer  "create_time_at",        limit: 4
    t.datetime "create_date_at"
    t.integer  "update_time_at",        limit: 4
    t.datetime "update_date_at"
  end

  create_table "controllers", force: :cascade do |t|
    t.string "controller_name", limit: 128
  end

  create_table "user_access_controls", force: :cascade do |t|
    t.integer "user_group_id", limit: 4
  end

  create_table "user_groups", force: :cascade do |t|
    t.string "user_group_name", limit: 255
    t.string "user_create",     limit: 255
  end

  create_table "user_menus", force: :cascade do |t|
    t.string  "name",           limit: 128
    t.integer "controller_id",  limit: 4
    t.string  "parameter",      limit: 255
    t.integer "parent_menu_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",          limit: 255
    t.string   "password",          limit: 255
    t.string   "email",             limit: 255
    t.integer  "user_group_id",     limit: 4
    t.string   "firstname",         limit: 255
    t.string   "lastname",          limit: 255
    t.integer  "created_by",        limit: 4
    t.datetime "created_at"
    t.datetime "lastlogin_date_at"
    t.integer  "lastlogin_time_at", limit: 4
  end

end
