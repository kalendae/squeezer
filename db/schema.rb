# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090930221147) do

  create_table "deviations", :force => true do |t|
    t.string   "etf"
    t.string   "base"
    t.datetime "start"
    t.datetime "stop"
    t.float    "base_change"
    t.float    "etf_change"
    t.float    "degradation"
  end

  add_index "deviations", ["base"], :name => "index_deviations_on_base"
  add_index "deviations", ["base_change"], :name => "index_deviations_on_base_change"
  add_index "deviations", ["degradation"], :name => "index_deviations_on_degradation"
  add_index "deviations", ["etf"], :name => "index_deviations_on_etf"
  add_index "deviations", ["etf_change"], :name => "index_deviations_on_etf_change"
  add_index "deviations", ["start"], :name => "index_deviations_on_start"
  add_index "deviations", ["stop"], :name => "index_deviations_on_stop"

  create_table "records", :force => true do |t|
    t.string   "ticker"
    t.datetime "trade_date"
    t.float    "open"
    t.float    "close"
    t.float    "adj_close"
  end

  add_index "records", ["adj_close"], :name => "index_records_on_adj_close"
  add_index "records", ["close"], :name => "index_records_on_close"
  add_index "records", ["open"], :name => "index_records_on_open"
  add_index "records", ["ticker"], :name => "index_records_on_ticker"
  add_index "records", ["trade_date"], :name => "index_records_on_trade_date"

  create_table "runs", :force => true do |t|
    t.string   "main"
    t.string   "opposite"
    t.datetime "start"
    t.datetime "stop"
    t.integer  "main_shares"
    t.integer  "opposite_shares"
    t.integer  "duration"
    t.float    "main_enter_price"
    t.float    "opposite_enter_price"
    t.float    "main_exit_price"
    t.float    "opposite_exit_price"
    t.float    "gain"
    t.float    "percentgain"
  end

  add_index "runs", ["duration"], :name => "index_runs_on_duration"
  add_index "runs", ["gain"], :name => "index_runs_on_gain"
  add_index "runs", ["main"], :name => "index_runs_on_main"
  add_index "runs", ["opposite"], :name => "index_runs_on_opposite"
  add_index "runs", ["percentgain"], :name => "index_runs_on_percentgain"
  add_index "runs", ["start"], :name => "index_runs_on_start"
  add_index "runs", ["stop"], :name => "index_runs_on_stop"

end
