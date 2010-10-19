class CreatePatientProfilesForTesting < ActiveRecord::Migration
  def self.up
    PatientProfile.create!(:name => 'Plastic Surgery Patient')
    PatientProfile.create!(:name => 'Dermatology Patient')
    PatientProfile.create!(:name => 'Occupational Therapy Patient')
  end

  def self.down
  end
end
