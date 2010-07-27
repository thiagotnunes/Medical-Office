class ChangeAddressColumn < ActiveRecord::Migration
  def self.up
    rename_column :addresses, :address, :location
  end

  def self.down
  end
end
