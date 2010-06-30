class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy
	has_many :evolutions, :dependent => :destroy

	accepts_nested_attributes_for :telephones, :allow_destroy => true
	accepts_nested_attributes_for :evolutions, :allow_destroy => true

	validates_presence_of :name, :cpf, :rg, :sex, :birth_date, :health_insurance_id, :address, :address_number
	validates_associated :health_insurance, :telephones, :evolutions

end
