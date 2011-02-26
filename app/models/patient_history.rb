class PatientHistory < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :patient_history_label
  
  validates_presence_of :history
  
end
