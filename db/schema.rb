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

ActiveRecord::Schema.define(version: 20140603144440) do

  create_table "colors", force: true do |t|
    t.integer  "product_id"
    t.string   "name"
    t.integer  "position"
    t.integer  "publishable_flag", limit: 1
    t.integer  "deleted",          limit: 1, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: true do |t|
    t.integer  "product_id"
    t.datetime "canceled_at"
    t.string   "discount_color",               default: "o"
    t.integer  "shopping_event_id"
    t.integer  "publishable_flag",  limit: 1
    t.string   "keyword"
    t.string   "type",              limit: 13
    t.integer  "position",                     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_infos", force: true do |t|
    t.string   "name"
    t.text     "spec"
    t.string   "brand_code",       limit: 16
    t.integer  "publishable_flag", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string  "strapline"
    t.string  "brand_name"
    t.integer "info_id"
  end

  create_table "shopping_event_groups", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publishable_flag", limit: 1
  end

  create_table "shopping_events", force: true do |t|
    t.string   "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "group_id"
    t.string   "brand"
    t.text     "email_editorial"
    t.datetime "canceled_at"
    t.integer  "group_position",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publishable_flag", limit: 1
  end

  create_table "sku_units", force: true do |t|
    t.integer "sku_id"
    t.string  "state",  limit: 64
  end

  create_table "skus", force: true do |t|
    t.string  "size",             limit: 50
    t.integer "color_id",                    default: 0
    t.string  "code"
    t.integer "publishable_flag", limit: 1
    t.string  "season"
    t.integer "price_cents"
    t.integer "msrp_cents"
  end

end
