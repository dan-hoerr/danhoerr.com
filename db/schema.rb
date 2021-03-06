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

ActiveRecord::Schema.define(:version => 20120725221320) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "cssclass"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "planes", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "title"
    t.text     "text"
    t.string   "img"
    t.string   "cardtype"
    t.string   "multiverseid"
  end

  create_table "portfolios", :force => true do |t|
    t.string   "project_name"
    t.text     "tasks"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "image"
    t.string   "link"
    t.boolean  "public"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "role"
  end

end
