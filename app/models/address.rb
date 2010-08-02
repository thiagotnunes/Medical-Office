class Address < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :address_label
  
  validates_presence_of :address_label, :location
  validates_associated :address_label
  
end
