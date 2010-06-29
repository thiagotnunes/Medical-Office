class Telephone < ActiveRecord::Base

  belongs_to :telephone_label
  belongs_to :patient
  
end
