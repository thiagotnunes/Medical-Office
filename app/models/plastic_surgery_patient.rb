class PlasticSurgeryPatient < Patient
  
  accepts_nested_attributes_for :patient_clinical_information
  
  validates_associated :patient_clinical_information
  
end
