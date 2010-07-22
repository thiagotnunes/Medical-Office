class PatientHistory < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :patient_history_label
  
end
