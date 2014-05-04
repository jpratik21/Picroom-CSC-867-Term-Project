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

ActiveRecord::Schema.define(version: 20140502010756) do

  create_table "albums", force: true do |t|
    t.integer  "user_id"
    t.string   "name",        limit: 25
    t.boolean  "private",                default: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "albums_photos", force: true do |t|
    t.integer "album_id"
    t.integer "photo_id"
  end

  add_index "albums_photos", ["album_id", "photo_id"], name: "index_albums_photos_on_album_id_and_photo_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.string   "name",        limit: 25
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "user_name",  limit: 25,              null: false
    t.string   "password",   limit: 40,              null: false
    t.string   "email",                 default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

end