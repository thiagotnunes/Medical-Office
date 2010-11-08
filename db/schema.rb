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

ActiveRecord::Schema.define(:version => 20101108135556) do

  create_table "address_labels", :force => true do |t|
    t.string   "label",      :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "location",         :limit => 250, :null => false
    t.string   "complement",       :limit => 250
    t.integer  "address_label_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "patient_clinical_informations", :force => true do |t|
    t.string   "clazz",                      :limit => 100
    t.text     "appointment_reason",                        :null => false
    t.date     "injury_exists_from"
    t.string   "injury_side",                :limit => 10
    t.string   "injury_appraiser_physician", :limit => 100
    t.string   "evolution_time",             :limit => 100
    t.text     "physical_exam"
    t.date     "physical_exam_date"
    t.text     "diagnostics_hypothesis"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_histories", :force => true do |t|
    t.text     "history"
    t.integer  "patient_history_label_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_history_labels", :force => true do |t|
    t.string   "label",      :limit => 100, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_pictures", :force => true do |t|
    t.string   "picture_file_name",    :limit => 250, :null => false
    t.string   "picture_content_type", :limit => 250, :null => false
    t.integer  "picture_file_size",                   :null => false
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_surgeries", :force => true do |t|
    t.text     "evaluations_results"
    t.string   "indicated_conduct",    :limit => 250
    t.string   "cid",                  :limit => 30
    t.text     "surgery_performed"
    t.date     "surgery_date",                        :null => false
    t.string   "surgery_performed_at", :limit => 250, :null => false
    t.string   "surgery_anesthethist", :limit => 250
    t.text     "surgery_description",                 :null => false
    t.string   "po_imediate_result",   :limit => 250
    t.text     "intercurrences"
    t.string   "pathology_material",   :limit => 50
    t.string   "pathology_result",     :limit => 250
    t.string   "diagnosis",            :limit => 250, :null => false
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_therapy_informations", :force => true do |t|
    t.string   "diagnosis",                  :limit => 250, :null => false
    t.integer  "injury_time"
    t.string   "injury_appraiser_physician", :limit => 250
    t.text     "main_complaint"
    t.text     "disease_history"
    t.string   "impaired_limb",              :limit => 250
    t.text     "dominance"
    t.text     "adm"
    t.text     "fm"
    t.text     "sensibility"
    t.text     "aspect"
    t.text     "fo"
    t.text     "circumference"
    t.text     "avds"
    t.text     "dnpm"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "name",                    :limit => 100,                 :null => false
    t.string   "rg",                      :limit => 10,                  :null => false
    t.string   "cpf",                     :limit => 14,                  :null => false
    t.string   "sex",                     :limit => 10,                  :null => false
    t.date     "birth_date",                                             :null => false
    t.string   "health_insurance_number", :limit => 50,                  :null => false
    t.integer  "health_insurance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "record",                                 :default => 0,  :null => false
    t.string   "color",                   :limit => 20,  :default => "", :null => false
    t.string   "profession",              :limit => 50,  :default => "", :null => false
    t.string   "city",                    :limit => 100, :default => "", :null => false
    t.string   "state",                   :limit => 50,  :default => "", :null => false
    t.string   "country",                 :limit => 50,  :default => "", :null => false
    t.string   "fathers_name",            :limit => 100, :default => "", :null => false
    t.string   "mothers_name",            :limit => 100, :default => "", :null => false
    t.string   "forwarded_by",            :limit => 100
    t.string   "marital_status",          :limit => 50,  :default => "", :null => false
    t.date     "first_appointment"
    t.text     "orthoses"
    t.text     "conclusions"
    t.text     "objectives"
    t.text     "frequency"
    t.text     "main_complaint"
    t.string   "type",                    :limit => 50,  :default => "", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
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

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
