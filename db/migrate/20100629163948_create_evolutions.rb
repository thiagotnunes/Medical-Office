class CreateEvolutions < ActiveRecord::Migration
  def self.up
    create_table :evolutions do |t|
      t.date :attendance_date
      t.text :description
      t.references :patient

      t.timestamps
    end
  end

  def self.down
    drop_table :evolutions
  end
end
