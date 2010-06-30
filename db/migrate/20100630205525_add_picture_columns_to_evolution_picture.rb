class AddPictureColumnsToEvolutionPicture < ActiveRecord::Migration
  def self.up
		remove_column :evolution_pictures, :path
		add_column :evolution_pictures, :picture_file_name, :string
		add_column :evolution_pictures, :picture_content_type, :string
		add_column :evolution_pictures, :picture_file_size, :integer
  end

  def self.down
		add_column :evolution_pictures, :path
		remove_column :evolution_pictures, :picture_file_name
		remove_column :evolution_pictures, :picture_content_type
		remove_column :evolution_pictures, :picture_file_size
  end
end
