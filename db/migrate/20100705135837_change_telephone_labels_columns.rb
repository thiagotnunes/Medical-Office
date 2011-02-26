class ChangeTelephoneLabelsColumns < ActiveRecord::Migration
  def self.up
    change_column :telephone_labels, :label, :string, :limit => 50, :null => false
  end

  def self.down
  end
end
