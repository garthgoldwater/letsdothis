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

ActiveRecord::Schema.define(version: 20140808172403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.integer  "room_id",             null: false
    t.text     "body",                null: false
    t.string   "handle",              null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "message_parent_id",   null: false
    t.string   "message_parent_type", null: false
  end

  add_index "messages", ["handle"], name: "index_messages_on_handle", using: :btree
  add_index "messages", ["message_parent_id", "message_parent_type"], name: "index_messages_on_message_parent_id_and_message_parent_type", using: :btree
  add_index "messages", ["room_id"], name: "index_messages_on_room_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name",                           null: false
    t.string   "password_digest",                null: false
    t.boolean  "private",         default: true, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "topics", force: true do |t|
    t.text     "title",             null: false
    t.integer  "topic_parent_id",   null: false
    t.string   "topic_parent_type", null: false
    t.integer  "room_id",           null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "topics", ["room_id"], name: "index_topics_on_room_id", using: :btree
  add_index "topics", ["title"], name: "index_topics_on_title", unique: true, using: :btree
  add_index "topics", ["topic_parent_id", "topic_parent_type"], name: "index_topics_on_topic_parent_id_and_topic_parent_type", using: :btree

end
