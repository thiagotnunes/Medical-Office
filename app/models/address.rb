class Address < ActiveRecord::Base
  
  belongs_to :patient
  belongs_to :address_label
  
end