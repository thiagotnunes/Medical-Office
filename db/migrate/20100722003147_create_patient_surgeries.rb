class CreatePatientSurgeries < ActiveRecord::Migration
  def self.up
    create_table :patient_surgeries do |t|
      t.text :evaluations_results
      t.string :indicated_conduct, :limit => 250
      t.string :cid, :limit => 30
      t.text :surgery_performed
      t.date :surgery_date, :null => false
      t.string :surgery_performed_at, :limit => 250, :null => false
      t.string :surgery_anesthethist, :limit => 250
      t.text :surgery_description, :null => false
      t.string :po_imediate_result, :limit => 250
      t.text :intercurrences
      t.string :pathology_material, :limit => 50
      t.string :pathology_result, :limit => 250
      t.string :diagnosis, :limit => 250, :null => false
      
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_surgeries
  end
end
