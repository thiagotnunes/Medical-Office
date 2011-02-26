class PatientHistoryLabel < ActiveRecord::Base
  
  has_many :patient_histories
  
  validates_presence_of :label
  validates_uniqueness_of :label
  validates_length_of :label, :within => 5..100
  
end
