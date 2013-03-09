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

ActiveRecord::Schema.define(:version => 20130303193811) do

  create_table "pictures", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
    t.string   "path"
  end

  create_table "plots", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "first_stp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "poster"
  end

  create_table "storypoints", :force => true do |t|
    t.string   "name"
    t.string   "story"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "plot_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin",         :default => false
  end

  create_table "ways", :force => true do |t|
    t.integer  "from_storypoint"
    t.integer  "to_storypoint"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "with_text"
  end

end
