class Evolution < ActiveRecord::Base

  belongs_to :patient
	has_many :evolution_pictures

	attr_accessor :should_destroy

	after_update :save_evolution_pictures
  
  def should_destroy?
  	should_destroy.to_i == 1
  end

	def evolution_pictures_attributes=(evolution_pictures_attributes)
		evolution_pictures_attributes.each do |evolution_picture_attributes|
			if evolution_picture_attributes[:id].blank?
				evolution_pictures.build(evolution_picture_attributes)
			else
				puts evolution_pictures
				evolution_picture = evolution_pictures.detect { |ep| ep.id == evolution_picture_attributes[:id].to_i }
				evolution_picture.attributes = evolution_picture_attributes
			end
		end
	end

	def save_evolution_pictures
		evolution_pictures.each do |ep|
			if ep.should_destroy?
				ep.destroy
			else
				ep.save(false)
			end
		end
	end

end
