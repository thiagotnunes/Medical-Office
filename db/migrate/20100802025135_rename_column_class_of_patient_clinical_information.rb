class RenameColumnClassOfPatientClinicalInformation < ActiveRecord::Migration
  def self.up
    rename_column :patient_clinical_informations, :class, :clazz
  end

  def self.down
  end
end
