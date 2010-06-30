class Telephone < ActiveRecord::Base

  belongs_to :telephone_label
  belongs_to :patient
  
	validates_presence_of :number, :telephone_label_id, :patient_id
	validates_associated :telephone_label

end
