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

ActiveRecord::Schema.define(:version => 20120830193214) do

  create_table "addresses", :force => true do |t|
    t.string   "city"
    t.string   "street"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specialties", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "specialties", ["name"], :name => "index_specialties_on_name", :unique => true

  create_table "surgeries", :force => true do |t|
    t.string   "name",         :null => false
    t.integer  "specialty_id", :null => false
    t.integer  "address_id",   :null => false
    t.string   "phone"
    t.string   "email"
    t.string   "web"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "open_mo"
    t.string   "open_tu"
    t.string   "open_we"
    t.string   "open_th"
    t.string   "open_fr"
    t.string   "open_sa"
    t.string   "open_su"
    t.string   "break"
  end

  add_index "surgeries", ["address_id"], :name => "index_surgeries_on_address_id"
  add_index "surgeries", ["name"], :name => "index_surgeries_on_name", :unique => true
  add_index "surgeries", ["specialty_id"], :name => "index_surgeries_on_specialty_id"

end
