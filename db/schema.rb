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

ActiveRecord::Schema.define(version: 20141102150359) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commodities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meal_id"
  end

  add_index "dishes", ["meal_id"], name: "index_dishes_on_meal_id"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "plural"
  end

  create_table "me_res", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "meal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_sort_order"
  end

  create_table "meals", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "meeting_id"
    t.string   "ingress"
    t.integer  "sort_order"
  end

  create_table "meetings", force: true do |t|
    t.string   "name"
    t.date     "meet_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_1"
  end

  create_table "re_ins", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount"
    t.string   "unit"
    t.integer  "ingredient_sort_order"
  end

  create_table "recipes", force: true do |t|
    t.string   "title"
    t.string   "ingress"
    t.text     "body",            limit: 255
    t.integer  "servings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prepare_hours"
    t.integer  "prepare_minutes"
    t.integer  "cooking_hours"
    t.integer  "cooking_minutes"
    t.integer  "meal_id"
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "commodity_id"
    t.integer  "sort_order"
  end

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
