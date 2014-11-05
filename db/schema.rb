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

ActiveRecord::Schema.define(version: 20141104153507) do

  create_table "blogs", force: true do |t|
    t.text     "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blog_views",           default: 0, null: false
    t.integer  "favorite_blogs_count", default: 0, null: false
  end

  add_index "blogs", ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at", using: :btree

  create_table "favorite_blogs", force: true do |t|
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_blogs", ["blog_id"], name: "index_favorite_blogs_on_blog_id", using: :btree
  add_index "favorite_blogs", ["user_id"], name: "index_favorite_blogs_on_user_id", using: :btree

  create_table "favorite_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_projects", ["project_id"], name: "index_favorite_projects_on_project_id", using: :btree
  add_index "favorite_projects", ["user_id"], name: "index_favorite_projects_on_user_id", using: :btree

  create_table "favorite_topics", force: true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorite_topics", ["topic_id"], name: "index_favorite_topics_on_topic_id", using: :btree
  add_index "favorite_topics", ["user_id"], name: "index_favorite_topics_on_user_id", using: :btree

  create_table "forums", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topics_count", default: 0, null: false
    t.integer  "forum_views",  default: 0, null: false
  end

  add_index "forums", ["created_at"], name: "index_forums_on_user_id_and_created_at", using: :btree

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "journals", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "projects_count", default: 0, null: false
    t.string   "name"
  end

  add_index "journals", ["user_id", "created_at"], name: "index_journals_on_user_id_and_created_at", using: :btree

  create_table "profiles", force: true do |t|
    t.text     "website"
    t.text     "profile"
    t.text     "avatar"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.text     "title"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_views",           default: 0, null: false
    t.integer  "favorite_projects_count", default: 0, null: false
    t.integer  "journal_id",              default: 0, null: false
  end

  add_index "projects", ["user_id", "created_at"], name: "index_projects_on_user_id_and_created_at", using: :btree

  create_table "topics", force: true do |t|
    t.text     "title"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_views",           default: 0, null: false
    t.integer  "favorite_topics_count", default: 0, null: false
  end

  add_index "topics", ["user_id", "forum_id", "created_at"], name: "index_topics_on_user_id_and_forum_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email",                   default: " ", null: false
    t.string   "encrypted_password",      default: " ", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "projects_count",          default: 0,   null: false
    t.integer  "blogs_count",             default: 0,   null: false
    t.integer  "topics_count",            default: 0,   null: false
    t.integer  "favorite_projects_count", default: 0,   null: false
    t.integer  "favorite_blogs_count",    default: 0,   null: false
    t.integer  "favorite_topics_count",   default: 0,   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
