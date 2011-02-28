class ChangeEvolutionPicturesColumns < ActiveRecord::Migration
  def self.up
    change_column :evolution_pictures, :picture_file_name, :string, :limit => 250, :null => false
    change_column :evolution_pictures, :picture_content_type, :string, :limit => 250, :null => false
    change_column :evolution_pictures, :picture_file_size, :integer, :null => false
  end

  def self.down
  end
end
