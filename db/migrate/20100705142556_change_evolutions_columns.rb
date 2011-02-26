class ChangeEvolutionsColumns < ActiveRecord::Migration
  def self.up
    change_column :evolutions, :attendance_date, :date, :null => false
    change_column :evolutions, :description, :text, :null => false
  end

  def self.down
  end
end
