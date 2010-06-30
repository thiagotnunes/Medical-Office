class EvolutionPicture < ActiveRecord::Base
 
	belongs_to :evolution

	validates_presence_of :path

end
