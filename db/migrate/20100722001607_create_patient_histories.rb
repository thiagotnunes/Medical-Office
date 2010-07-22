class CreatePatientHistories < ActiveRecord::Migration
    def self.up
      create_table :patient_histories do |t|
        t.text :history
        
        t.references :patient_history_labels
        t.references :patient
        t.timestamps
      end 
    end

    def self.down
      drop_table :patient_histories
    end
  end