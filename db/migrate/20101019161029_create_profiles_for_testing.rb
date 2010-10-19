class CreateProfilesForTesting < ActiveRecord::Migration
  def self.up
    Profile.create!(:name => 'Plastic Surgery Patient', :is_patient => true)
    Profile.create!(:name => 'Dermatology Patient', :is_patient => true)
    Profile.create!(:name => 'Occupational Therapy Patient', :is_patient => true)
    Profile.create!(:name => 'Secretary', :is_patient => false)
  end

  def self.down
  end
end
