class PatientSurgery < ActiveRecord::Base
  
  belongs_to :patient
  
  validates_presence_of :surgery_date, :surgery_performed_at, :surgery_description, :diagnosis
  
  validates_length_of :indicated_conduct, :maximum => 250
  validates_length_of :cid, :maximum => 30
  validates_length_of :surgery_performed_at, :maximum => 250
  validates_length_of :surgery_anesthethist, :maximum => 250
  validates_length_of :po_imediate_result, :maximum => 250
  validates_length_of :pathology_material, :maximum => 50
  validates_length_of :pathology_result, :maximum => 250
  validates_length_of :diagnosis, :maximum => 250
  
  validate :should_not_have_surgery_date_in_the_future
  
  def should_not_have_surgery_date_in_the_future
    errors.add(:surgery_date, "can't be in the future") if surgery_date != nil && surgery_date > Date.today
  end
  
end
