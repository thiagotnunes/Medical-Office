class Evolution < ActiveRecord::Base

  belongs_to :patient
	has_many :evolution_pictures, :dependent => :destroy

	accepts_nested_attributes_for :evolution_pictures, :reject_if => lambda { |a| a[:path].empty? }, :allow_destroy => true

end
