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

ActiveRecord::Schema.define(:version => 20100625214111) do

  create_table "health_insurances", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.string   "sex"
    t.date     "birth_date"
    t.string   "health_insurance_number"
    t.string   "address"
    t.string   "address_number"
    t.integer  "health_insurance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephone_labels", :force => true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephones", :force => true do |t|
    t.integer  "telephone_label_id"
    t.string   "number"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
