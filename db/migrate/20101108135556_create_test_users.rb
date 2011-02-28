class CreateTestUsers < ActiveRecord::Migration
  def self.up
    secretary = User.create!(:email => 'secretary@medical_office.com', :password => 'thiagotnunes', :password_confirmation => 'thiagotnunes', :role => Role.find_by_name('secretary'))
    
    dermatology = User.create!(:email => 'dermatology@medical_office.com', :password => 'thiagotnunes', :password_confirmation => 'thiagotnunes', :role => Role.find_by_name('dermatology_doctor'))
    
    occupational = User.create!(:email => 'occupational@medical_office.com', :password => 'thiagotnunes', :password_confirmation => 'thiagotnunes', :role => Role.find_by_name('occupational_therapy_doctor'))
    
    plastic = User.create!(:email => 'plastic@medical_office.com', :password => 'thiagotnunes', :password_confirmation => 'thiagotnunes', :role => Role.find_by_name('plastic_surgery_doctor'))
  end

  def self.down
    secretary = User.find_by_email(:email => 'secretary@medical_office.com').destroy
    dermatology = User.find_by_email(:email => 'dermatology@medical_office.com').destroy
    occupational = User.find_by_email(:email => 'occupational@medical_office.com').destroy
    plastic = User.find_by_email(:email => 'plastic@medical_office.com').destroy
  end
end
