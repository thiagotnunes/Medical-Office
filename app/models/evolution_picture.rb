class EvolutionPicture < ActiveRecord::Base
 
	belongs_to :evolution

	has_attached_file :picture, :styles => { :medium => "400x400", :thumb => "200x200" }

end
