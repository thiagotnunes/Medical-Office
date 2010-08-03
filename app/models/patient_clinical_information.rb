class PatientClinicalInformation < ActiveRecord::Base
  
  belongs_to :patient
  
  validates_presence_of :appointment_reason
  
  validates_length_of :clazz, :maximum => 100
  validates_length_of :injury_side, :maximum => 10
  validates_length_of :injury_appraiser_physician, :maximum => 100
  validates_length_of :evolution_time, :maximum => 100
    
end
