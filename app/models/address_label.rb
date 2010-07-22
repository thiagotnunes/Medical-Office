class AddressLabel < ActiveRecord::Base
  
  has_many :addresses
  
  validates_presence_of :label
  validates_uniqueness_of :label
  validates_length_of :label, :within => 4..100
  
end
