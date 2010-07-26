class Address < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :address_label
  
  validates_presence_of :address, :address_label_id
  
end
