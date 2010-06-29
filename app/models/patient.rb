class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy, :include => :telephone_labels
	has_many :evolutions, :dependent => :destroy, :include => :evolution_pictures

	validates_associated :telephones, :evolutions

	after_update :save_telephones, :save_evolutions

	def telephones_attributes=(telephones_attributes)
		telephones_attributes.each do |telephone_attributes|
			if telephone_attributes[:id].blank?
				telephones.build(telephone_attributes)
			else
				telephone = telephones.detect { |t| t.id == telephone_attributes[:id].to_i }
				telephone.attributes = telephone_attributes
			end
		end
	end
	
	def save_telephones
		telephones.each do |t|
			if t.should_destroy?
				t.destroy
			else
				t.save(false)
			end
		end
	end

	def evolutions_attributes=(evolutions_attributes)
		evolutions_attributes.each do |evolution_attributes|
			if evolution_attributes[:id].blank?
				evolutions.build(evolution_attributes)
			else
				evolution = evolutions.detect { |e| e.id == evolution_attributes[:id].to_i }
				evolution.attributes = evolution_attributes
			end
		end
	end

	def save_evolutions
		evolutions.each do |e|
			if e.should_destroy?
				e.destroy
			else
				e.save(false)
			end
		end
	end

end
