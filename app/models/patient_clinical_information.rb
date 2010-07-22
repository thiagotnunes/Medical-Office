class PatientClinicalInformation < ActiveRecord::Base
  
  belongs_to :patient
  
end