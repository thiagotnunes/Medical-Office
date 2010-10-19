class Profiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name, :limit => 50, :null => false
      t.boolean :is_patient, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :telephone_labels
  end
end
