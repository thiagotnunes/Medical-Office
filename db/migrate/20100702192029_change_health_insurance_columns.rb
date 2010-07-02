class ChangeHealthInsuranceColumns < ActiveRecord::Migration
  def self.up
    change_column :health_insurances, :name, :string, :limit => 50, :null => false
  end

  def self.down
  end
end
