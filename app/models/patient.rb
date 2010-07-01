class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy
	has_many :evolutions, :dependent => :destroy

	accepts_nested_attributes_for :telephones, :allow_destroy => true
	accepts_nested_attributes_for :evolutions, :allow_destroy => true, :reject_if => proc { |e| e['description'].empty? || e['attendance_date'].empty? }

	validates_presence_of :name, :cpf, :rg, :sex, :birth_date, :health_insurance_id, :address, :address_number
	validates_numericality_of :cpf, :rg
	validates_length_of :cpf, :is => 11
	validates_length_of :rg, :is => 10
	validates_uniqueness_of :cpf, :rg
	validates_associated :health_insurance, :telephones

end
