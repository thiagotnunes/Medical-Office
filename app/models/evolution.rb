class Evolution < ActiveRecord::Base

  belongs_to :patient
	has_many :evolution_pictures, :dependent => :destroy

	accepts_nested_attributes_for :evolution_pictures, :allow_destroy => true

	validates_presence_of :attendance_date, :description
	#validates_associated :evolution_pictures

end
