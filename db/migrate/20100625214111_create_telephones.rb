class CreateTelephones < ActiveRecord::Migration
  def self.up
    create_table :telephones do |t|
      t.references :telephone_label
      t.string :number
      t.references :patient

      t.timestamps
    end
  end

  def self.down
    drop_table :telephones
  end
end
