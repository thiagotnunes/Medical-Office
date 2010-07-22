class CreatePatientHistoryLabels < ActiveRecord::Migration
  def self.up
    create_table :patient_history_labels do |t|
      t.string :label, :limit => 100, :null => false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_history_labels
  end
end
