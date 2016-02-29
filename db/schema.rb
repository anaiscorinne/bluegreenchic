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

ActiveRecord::Schema.define(version: 20160229213142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "description"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "post_image"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "instagram"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.string   "facebook"
    t.string   "twitter"
  end

  create_table "brandstores", force: :cascade do |t|
    t.integer  "store_id"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "brandstores", ["brand_id"], name: "index_brandstores_on_brand_id", using: :btree
  add_index "brandstores", ["store_id"], name: "index_brandstores_on_store_id", using: :btree

  create_table "keybrands", force: :cascade do |t|
    t.integer  "brand_id"
    t.integer  "keyvalue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "keybrands", ["brand_id"], name: "index_keybrands_on_brand_id", using: :btree
  add_index "keybrands", ["keyvalue_id"], name: "index_keybrands_on_keyvalue_id", using: :btree

  create_table "keyvalues", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "icon"
  end

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "instagram"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "ig_url"
    t.string   "desc_preview"
    t.string   "phone"
    t.string   "ig_url_two"
    t.string   "ig_url_three"
    t.string   "ig_url_four"
    t.string   "ig_url_one"
    t.json     "images"
    t.decimal  "lat"
    t.decimal  "lng"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.date     "birthday"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "brandstores", "brands"
  add_foreign_key "brandstores", "stores"
  add_foreign_key "keybrands", "brands"
  add_foreign_key "keybrands", "keyvalues"
end
