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

ActiveRecord::Schema.define(version: 20140827053958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: true do |t|
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "group_id",           null: false
    t.string   "title",              null: false
    t.integer  "parent_document_id"
  end

  add_index "documents", ["group_id"], name: "index_documents_on_group_id", using: :btree
  add_index "documents", ["parent_document_id"], name: "index_documents_on_parent_document_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name",                           null: false
    t.string   "password_digest",                null: false
    t.boolean  "private",         default: true, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "document_id"
  end

  add_index "groups", ["document_id"], name: "index_groups_on_document_id", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "document_id", null: false
    t.text     "body",        null: false
    t.string   "handle",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["document_id"], name: "index_messages_on_document_id", using: :btree
  add_index "messages", ["handle"], name: "index_messages_on_handle", using: :btree

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
