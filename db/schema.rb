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

ActiveRecord::Schema.define(:version => 20110517094558) do

  create_table "attractions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "opentime"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baggage_lists", :force => true do |t|
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hot_places", :force => true do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hot_plans", :force => true do |t|
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journeys", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "from_to"
    t.decimal  "budget"
    t.string   "type"
    t.integer  "type_id"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_attractions", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "attraction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_places", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "start_off_place"
    t.date     "start_off_date"
    t.integer  "people_num"
    t.integer  "user_id"
    t.integer  "travel_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recommend_plans", :force => true do |t|
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", :force => true do |t|
    t.date     "plan_date"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "travel_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
