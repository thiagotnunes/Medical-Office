class AddColumnsToPatient < ActiveRecord::Migration
  def self.up
    # Personal
    add_column :patients, :record, :integer, :null => false, :default => 0
    # Name
    # Cpf
    # Rg
    # Sex
    add_column :patients, :color, :string, :null => false, :limit => 20, :default => ''
    # Birth date
    add_column :patients, :profession, :string, :null => false, :limit => 50, :default => ''
    # Adresses
    remove_column :patients, :address
    remove_column :patients, :address_number
    # Telephones
    # Other info
    add_column :patients, :city, :string, :null => false, :limit => 100, :default => ''
    add_column :patients, :state, :string, :null => false, :limit => 50, :default => ''
    add_column :patients, :country, :string, :null => false, :limit => 50, :default => '' # nationality (naturalidade)
    add_column :patients, :fathers_name, :string, :null => false, :limit => 100, :default => ''
    add_column :patients, :mothers_name, :string, :null => false, :limit => 100, :default => ''
    add_column :patients, :forwarded_by, :string, :limit => 100
    add_column :patients, :marital_status, :string, :null => false, :limit => 50, :default => ''
    # Patient photos
    
    # Plast - Histories
    add_column :patients, :first_appointment, :date, :default => 0
    # Plast - Clinical Data
    # Plast - Surgeries
    
    # Therapy
    add_column :patients, :orthoses, :text
    add_column :patients, :conclusions, :text
    add_column :patients, :objectives, :text
    add_column :patients, :frequency, :text
    # Occupational Therapy Information
    # Other surgeries
    
    # Dermathology
    # Main complaint
    # Histories
    
    # Single Table Inheritance Type
    add_column :patients, :type, :string, :null => false, :limit => 50, :default => ''
  end

  def self.down
  end
end
