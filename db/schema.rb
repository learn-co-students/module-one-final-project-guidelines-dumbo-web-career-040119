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

ActiveRecord::Schema.define(version: 20190416155303) do

  create_table "articles", force: :cascade do |t|
    t.string "slot"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "pricepoint"
  end

  create_table "clothings", force: :cascade do |t|
    t.string  "name"
    t.string  "material"
    t.float   "price"
    t.integer "brand_id"
    t.integer "article_id"
  end

end
