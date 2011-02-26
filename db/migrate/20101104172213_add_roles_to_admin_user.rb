class AddRolesToAdminUser < ActiveRecord::Migration
  def self.up
    user = User.find_by_email('thiago@medical_office.com')
    user.roles << Role.find_by_name('admin')
    user.save!
  end

  def self.down
    user = User.find_by_email('thiago@medical_office.com')
    user.roles = []
    user.save!
  end
end
