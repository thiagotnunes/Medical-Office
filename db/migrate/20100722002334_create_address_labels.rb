class CreateAddressLabels < ActiveRecord::Migration
  def self.up
    create_table :address_labels do |t|
      t.string :label, :null => false, :limit => 100
      
      t.timestamps
    end
  end

  def self.down
    drop_table :address_labels
  end
end
