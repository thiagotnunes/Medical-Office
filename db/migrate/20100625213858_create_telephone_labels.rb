class CreateTelephoneLabels < ActiveRecord::Migration
  def self.up
    create_table :telephone_labels do |t|
      t.string :label

      t.timestamps
    end
  end

  def self.down
    drop_table :telephone_labels
  end
end
