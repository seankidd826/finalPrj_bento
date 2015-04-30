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

ActiveRecord::Schema.define(version: 20150430135450) do

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "confirms", force: :cascade do |t|
    t.string   "confirm_name"
    t.string   "confirm_phone"
    t.text     "confirm_address"
    t.integer  "confirm_menu_count"
    t.integer  "confirm_menu_id"
    t.integer  "confirm_user_id"
    t.integer  "confirm_total_price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "confirms", ["confirm_menu_id"], name: "index_confirms_on_confirm_menu_id"
  add_index "confirms", ["confirm_user_id"], name: "index_confirms_on_confirm_user_id"

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "cart_id"
    t.integer  "qty"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["menu_id"], name: "index_line_items_on_menu_id"
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id"

  create_table "menus", force: :cascade do |t|
    t.string   "title"
    t.text     "contents"
    t.integer  "price"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "likes_count",         default: 0
    t.integer  "in_stock_qty",        default: 10
    t.string   "mompic_file_name"
    t.string   "mompic_content_type"
    t.integer  "mompic_file_size"
    t.datetime "mompic_updated_at"
    t.string   "mominfo"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "user_id"
    t.integer  "total_price",   default: 0
    t.integer  "menu_count",    default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "order_name"
    t.string   "order_phone"
    t.text     "order_address"
    t.string   "order_email"
  end

  create_table "storys", force: :cascade do |t|
    t.string   "momheader"
    t.text     "momcontents"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "user_menus", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.text     "address"
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
    t.string   "provider"
    t.string   "uid"
    t.string   "fb_image"
    t.string   "fb_uid"
    t.string   "fb_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
