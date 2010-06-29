class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy
	has_many :evolutions, :dependent => :destroy

	accepts_nested_attributes_for :telephones, :reject_if => lambda { |a| a[:number].empty? }, :allow_destroy => true
	accepts_nested_attributes_for :evolutions, :reject_if => lambda { |a| a[:description].empty? }, :allow_destroy => true

end
