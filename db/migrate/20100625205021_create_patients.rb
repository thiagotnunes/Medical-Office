class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
			t.string :name
			t.string :rg
			t.string :cpf
			t.string :sex
			t.date :birth_date
			t.string :health_insurance_number
			t.string :address
			t.string :address_number
			t.references :health_insurance

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
