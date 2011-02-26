class TelephoneLabel < ActiveRecord::Base

	has_many :telephones

	validates_presence_of :label
	validates_uniqueness_of :label
  validates_length_of :label, :within => 3..50

end
