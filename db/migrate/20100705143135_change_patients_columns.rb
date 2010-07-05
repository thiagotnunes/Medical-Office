class ChangePatientsColumns < ActiveRecord::Migration
  def self.up
    change_column :patients, :name, :string, :limit => 100, :null => false
    change_column :patients, :rg, :string, :limit => 10, :null => false 
    change_column :patients, :cpf, :string, :limit => 14, :null => false
    change_column :patients, :sex, :string, :limit => 10, :null => false
    change_column :patients, :birth_date, :date, :null => false
    change_column :patients, :health_insurance_number, :string, :limit => 50, :null => false
    change_column :patients, :address, :string, :limit => 250, :null => false
    change_column :patients, :address_number, :string, :limit => 100, :null => false
  end

  def self.down
  end
end
