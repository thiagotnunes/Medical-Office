class CreateAdminUser < ActiveRecord::Migration
  def self.up
    User.create!(:email => 'thiago@medical_office.com', :password => 'thiagotnunes', :password_confirmation => 'thiagotnunes', :role => Role.find_by_name('admin'))
  end

  def self.down
    User.find_by_email('thiago@medical_office.com').destroy
  end
end
