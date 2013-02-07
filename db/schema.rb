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

ActiveRecord::Schema.define(:version => 20130206224526) do

  create_table "asset_histories", :force => true do |t|
    t.string   "comments"
    t.integer  "serial_number_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "asset_histories", ["serial_number_id"], :name => "index_asset_histories_on_serial_number_id"

  create_table "assignment_histories", :force => true do |t|
    t.integer  "checkout_id"
    t.string   "note"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "assignment_histories", ["checkout_id"], :name => "index_assignment_histories_on_checkout_id"

  create_table "bundle_attributes", :force => true do |t|
    t.string   "bundle_key"
    t.string   "bundle_value"
    t.integer  "bundle_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "bundle_attributes", ["bundle_id"], :name => "index_bundle_attributes_on_bundle_id"

  create_table "bundles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "checkouts", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "checkout_serial"
    t.datetime "due_date"
  end

  add_index "checkouts", ["item_id"], :name => "index_checkouts_on_item_id"
  add_index "checkouts", ["user_id"], :name => "index_checkouts_on_user_id"

  create_table "item_features", :force => true do |t|
    t.string   "feature_key"
    t.string   "feature_value"
    t.integer  "item_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "item_features", ["item_id"], :name => "index_item_features_on_item_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "bundle_id"
    t.boolean  "trackable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["bundle_id"], :name => "index_items_on_bundle_id"

  create_table "serial_numbers", :force => true do |t|
    t.string   "number"
    t.date     "warranty_end"
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "serial_numbers", ["item_id"], :name => "index_serial_numbers_on_item_id"
  add_index "serial_numbers", ["user_id"], :name => "index_serial_numbers_on_user_id"

  create_table "user_comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_comments", ["user_id"], :name => "index_user_comments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
