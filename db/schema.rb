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

ActiveRecord::Schema.define(version: 20160424172245) do

  create_table "wedding_invites", force: :cascade do |t|
    t.boolean  "is_coming"
    t.text     "extra_comments"
    t.string   "link_code"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "primary_invitee_name"
    t.string   "primary_invitee_meal"
    t.string   "guest_1_name"
    t.string   "guest_1_meal"
    t.string   "guest_2_name"
    t.string   "guest_2_meal"
    t.string   "guest_3_name"
    t.string   "guest_3_meal"
    t.string   "guest_4_name"
    t.string   "guest_4_meal"
    t.string   "language_code"
  end

  add_index "wedding_invites", ["link_code"], name: "index_wedding_invites_on_link_code", unique: true

end
