class Telephone < ActiveRecord::Base

  belongs_to :telephone_label
  belongs_to :patient
  
	validates_presence_of :telephone_label, :number
	validates_associated :telephone_label
  validates_length_of :number, :within => 6..50

end
