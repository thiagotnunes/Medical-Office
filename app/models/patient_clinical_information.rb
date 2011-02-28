class PatientClinicalInformation < ActiveRecord::Base
  
  belongs_to :patient
  
  validates_presence_of :appointment_reason
  
  validates_length_of :clazz, :maximum => 100
  validates_length_of :injury_side, :maximum => 10
  validates_length_of :injury_appraiser_physician, :maximum => 100
  validates_length_of :evolution_time, :maximum => 100
  
  validate :should_not_have_injury_exists_from_in_the_future
  validate :should_not_have_physical_exam_date_from_in_the_future
  
  def should_not_have_injury_exists_from_in_the_future
    errors.add(:injury_exists_from, "can't be in the future") if injury_exists_from != nil && injury_exists_from > Date.today
  end
  
  def should_not_have_physical_exam_date_from_in_the_future
    errors.add(:physical_exam_date, "can't be in the future") if physical_exam_date != nil && physical_exam_date > Date.today
  end
    
end
