class PatientProfiles < ActiveRecord::Migration
  def self.up
    create_table :patient_profiles do |t|
      t.string :name, :limit => 50, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_profiles
  end
end
