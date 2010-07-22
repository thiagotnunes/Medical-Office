class PatientTherapyInformation < ActiveRecord::Base
  
  belongs_to :patient
  
end