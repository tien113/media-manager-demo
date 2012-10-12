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

ActiveRecord::Schema.define(:version => 20121012174650) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "original_title"
    t.integer  "year"
    t.decimal  "rating",         :precision => 2, :scale => 1
    t.string   "resolution"
    t.string   "genre"
    t.boolean  "watched"
    t.string   "imdb_url"
    t.string   "image_url"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "movies", ["genre"], :name => "index_movies_on_genre"
  add_index "movies", ["original_title"], :name => "index_movies_on_original_title"
  add_index "movies", ["title"], :name => "index_movies_on_title"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
