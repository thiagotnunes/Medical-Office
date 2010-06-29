class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy

	validates_associated :telephones

	after_update :save_telephones

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

end
