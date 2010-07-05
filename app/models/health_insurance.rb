class HealthInsurance < ActiveRecord::Base

	has_many :patients

	validates_presence_of :name
	validates_uniqueness_of :name
  validates_length_of :name, :maximum => 50

end
