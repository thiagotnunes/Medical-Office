class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy

	def telephones_attributes=(telephones_attributes)
		telephones_attributes.each do |telephone_attributes|
			telephones.build(telephone_attributes)
		end
	end

end
