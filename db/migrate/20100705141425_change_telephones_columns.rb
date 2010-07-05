class ChangeTelephonesColumns < ActiveRecord::Migration
  def self.up
    change_column :telephones, :number, :string, :limit => 50, :null => false
  end

  def self.down
  end
end
