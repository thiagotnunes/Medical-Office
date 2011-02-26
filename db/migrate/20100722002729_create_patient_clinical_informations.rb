class CreatePatientClinicalInformations < ActiveRecord::Migration
  def self.up
    create_table :patient_clinical_informations do |t|
      t.string :class, :limit => 100
      t.text :appointment_reason, :null => false
      t.date :injury_exists_from
      t.string :injury_side, :limit => 10
      t.string :injury_appraiser_physician, :limit =>100
      t.string :evolution_time, :limit => 100
      t.text :physical_exam
      t.date :physical_exam_date
      t.text :diagnostics_hypothesis
      
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_clinical_informations
  end
end
