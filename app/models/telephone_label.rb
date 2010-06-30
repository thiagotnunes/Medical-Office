class TelephoneLabel < ActiveRecord::Base

	has_many :telephones

	validates_presence_of :label

end
