class PatientHistoryLabel < ActiveRecord::Base
  
  has_many :patient_histories
  
end