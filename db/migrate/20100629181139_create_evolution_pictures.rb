class CreateEvolutionPictures < ActiveRecord::Migration
  def self.up
    create_table :evolution_pictures do |t|
      t.string :path
      t.references :evolution

      t.timestamps
    end
  end

  def self.down
    drop_table :evolution_pictures
  end
end
