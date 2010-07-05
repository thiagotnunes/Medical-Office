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

ActiveRecord::Schema.define(:version => 20100705143135) do

  create_table "evolution_pictures", :force => true do |t|
    t.integer  "evolution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name",    :limit => 250, :null => false
    t.string   "picture_content_type", :limit => 250, :null => false
    t.integer  "picture_file_size",                   :null => false
  end

  create_table "evolutions", :force => true do |t|
    t.date     "attendance_date", :null => false
    t.text     "description",     :null => false
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "health_insurances", :force => true do |t|
    t.string   "name",       :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "name",                    :limit => 100, :null => false
    t.string   "rg",                      :limit => 10,  :null => false
    t.string   "cpf",                     :limit => 14,  :null => false
    t.string   "sex",                     :limit => 10,  :null => false
    t.date     "birth_date",                             :null => false
    t.string   "health_insurance_number", :limit => 50,  :null => false
    t.string   "address",                 :limit => 250, :null => false
    t.string   "address_number",          :limit => 100, :null => false
    t.integer  "health_insurance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephone_labels", :force => true do |t|
    t.string   "label",      :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephones", :force => true do |t|
    t.integer  "telephone_label_id"
    t.string   "number",             :limit => 50, :null => false
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
