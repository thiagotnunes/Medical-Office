class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy

end
