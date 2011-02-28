class Address < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :address_label
  
  validates_presence_of :address_label, :location
  validates_length_of :location, :maximum => 250
  validates_associated :address_label
  
end
