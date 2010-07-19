class AddColumnsToPatient < ActiveRecord::Migration
  def self.up
    # Personal
    add_column :patients, :record, :integer, :null => false
    # Name
    # Birth date
    # Sex
    add_column :patients, :fathers_name, :string, :null => false, :limit => 100
    add_column :patients, :mothers_name, :string, :null => false, :limit => 100
    add_column :patients, :color, :string, :null => false, :limit => 20
    add_column :patients, :profession, :string, :null => false, :limit => 50
    add_column :patients, :forwarded_by, :string :limit => 100
    rename_column :patients, :address, :residential_address
    rename_column :patients, :address_number, :residential_address_complement
    add_column :patients, :marital_status, :string, :null => false, :limit => 50
    add_column :patients, :city, :string, :null => false, :limit => 100
    add_column :patients, :state, :string, :null => false, :limit => 50
    add_column :patients, :nationality, :string, :null => false, :limit => 50
    add_column :patients, :professional_address, :string, :limit => 250
    add_column :patients, :professional_address_complement, :string, :limit => 250
    # Patient photos
    
    # Plast - Clinical Data
    add_column :patients, :appointment_reason, :text
    add_column :patients, :first_appointment, :date, :null => false
    add_column :patients, :injury_side, :string, :limit => 10
    add_column :patients, :injury_exists_from, :datetime
    add_column :patients, :injury_appraiser_physician, :string, :limit =>100
    add_column :patients, :evolution_time, :string, :limit => 100
    add_column :patients, :personal_history, :text
    add_column :patients, :physical_exam, :text
    add_column :patients, :physical_exam_date, :date
    add_column :patients, :diagnostics_hypothesis, :text
    
    # Plast - Evaluations
    add_column :patients, :evaluations_results, :text
    add_column :patients, :diagnosis, :string, :limit => 250
    add_column :patients, :cid, :string, :limit => 30
    add_column :patients, :indicated_conduct, :string, :limit => 250
    add_column :patients, :surgery_performed, :text
    add_column :patients, :surgery_date, :date
    add_column :patients, :surgery_anesthethist, :string, :limit => 250
    add_column :patients, :surgery_performed_at, :string, :limit => 250
    add_column :patients, :surgery_description, :text
    add_column :patients, :po_imediate_result, :string, :limit => 250
    add_column :patients, :intercurrences, :text
    add_column :patients, :pathology_material, :string, :limit => 50
    add_column :patients, :pathology_result, :string, :limit => 250
    # Other surgeries
    
    # Therapy
    # Diagnosis
    # Injury exists from
    # Injury appraiser physician
    add_column :patients, :main_complaint, :text
    add_column :patients, :disease_history, :text
    # Other surgeries
    add_column :patients, :impaired_limb, :string, :limit => 250
    add_column :patients, :dominance, :text
    add_column :patients, :adm, :text
    add_column :patients, :fm, :text
    add_column :patients, :sensibility, :text
    add_column :patients, :aspect, :text
    add_column :patients, :fo, :text
    add_column :patients, :circumference, :text
    add_column :patients, :avds, :text
    add_column :patients, :dnpm, :text
    add_column :patients, :orthoses, :text
    add_column :patients, :conclusions, :text
    add_column :patients, :objectives, :text
    add_column :patients, :frequency, :text
    
    # Dermathology
    # Main complaint
    add_column :patients, :medical_history, :text
    add_column :patients, :family_history, :text
    
    # Single Table Inheritance
    add_column :patients, :type, :string, :null => false, :limit => 50
  end

  def self.down
  end
end
