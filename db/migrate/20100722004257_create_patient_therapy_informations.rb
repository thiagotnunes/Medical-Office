class CreatePatientTherapyInformations < ActiveRecord::Migration
  def self.up
    create_table :patient_therapy_informations do |t|
      t.string :diagnosis, :limit => 250, :null => false
      t.integer :injury_time
      t.date :injury_time
      t.string :injury_appraiser_physician, :limit => 250
      t.text :main_complaint
      t.text :disease_history
      t.string :impaired_limb, :limit => 250
      t.text :dominance
      t.text :adm
      t.text :fm
      t.text :sensibility
      t.text :aspect
      t.text :fo
      t.text :circumference
      t.text :avds
      t.text :dnpm
      
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_therapy_informations
  end
end
