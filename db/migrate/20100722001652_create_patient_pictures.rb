class CreatePatientPictures < ActiveRecord::Migration
  def self.up
    create_table :patient_pictures do |t|
      t.string :picture_file_name, :limit => 250, :null => false
  		t.string :picture_content_type, :limit => 250, :null => false
  		t.integer :picture_file_size, :null => false
  		
      t.references :patients
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_pictures
  end
end
