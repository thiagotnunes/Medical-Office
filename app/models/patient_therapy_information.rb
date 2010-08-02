class PatientTherapyInformation < ActiveRecord::Base
  
  belongs_to :patient
  
  validates_presence_of :diagnosis
  
  validates_length_of :diagnosis, :maximum => 250
  validates_length_of :injury_appraiser_physician, :maximum => 250
  validates_length_of :impaired_limb, :maximum => 250
    
end