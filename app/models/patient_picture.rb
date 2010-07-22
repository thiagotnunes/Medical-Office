class PatientPicture < ActiveRecord::Base
  
  belongs_to :patient
  
  has_attached_file :picture, :styles => { :medium => "300x300", :thumb => "100x100" }
  
end