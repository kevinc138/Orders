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

ActiveRecord::Schema.define(version: 20150427193907) do

  create_table "cart_items", force: :cascade do |t|
    t.decimal  "price"
    t.integer  "quantity"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cart_id"
    t.integer  "item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",        precision: 6, scale: 2
    t.integer  "submenuId"
    t.integer  "restaurantId"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.decimal  "total"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "active"
    t.decimal  "subtotal"
    t.decimal  "tax"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.boolean  "visible"
    t.text     "description"
    t.string   "logo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "quantity"
    t.integer "item_id"
    t.string  "item_type"
    t.float   "price"
    t.integer "restaurant_id"
    t.string  "restaurant_name"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submenus", force: :cascade do |t|
    t.string   "name"
    t.string   "restaurant"
    t.integer  "restaurantId"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.integer  "restaurantid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
