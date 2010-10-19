class PatientProfile < ActiveRecord::Base
  
  validates_presence_of :name
  
  validates_length_of :name, :within => 6..50
  
end
