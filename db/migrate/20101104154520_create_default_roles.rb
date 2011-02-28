class CreateDefaultRoles < ActiveRecord::Migration
  def self.up
    Role.create!(:name => 'admin')
    Role.create!(:name => 'secretary')
    Role.create!(:name => 'plastic_surgery_doctor')
    Role.create!(:name => 'dermatology_doctor')
    Role.create!(:name => 'occupational_therapy_doctor')
  end

  def self.down
    Role.find_by_name('admin').destroy
    Role.find_by_name('secretary').destroy
    Role.find_by_name('plastic_surgery_doctor').destroy
    Role.find_by_name('dermatology_doctor').destroy
    Role.find_by_name('occupational_therapy_doctor').destroy
  end
end
