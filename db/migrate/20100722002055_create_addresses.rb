class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address, :limit => 250, :null => false
      t.string :complement, :limit => 250
      
      t.references :address_label
      t.references :patient
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
