class OccupationalTherapyPatient < Patient
  
  accepts_nested_attributes_for :patient_therapy_information
  
  validates_associated :patient_therapy_information
  
end
