class Patient < ActiveRecord::Base

	belongs_to :health_insurance

  has_one :patient_clinical_information, :dependent => :destroy

	has_many :addresses, :dependent => :destroy
  has_many :evolutions, :dependent => :destroy
  has_many :patient_histories, :dependent => :destroy
  has_many :patient_pictures, :dependent => :destroy
	has_many :patient_surgeries, :dependent => :destroy
	has_many :telephones, :dependent => :destroy
	
	accepts_nested_attributes_for :addresses, :allow_destroy => true
	accepts_nested_attributes_for :evolutions, :allow_destroy => true, :reject_if => proc { |e| e['description'].nil? || e['description'].empty? }
	accepts_nested_attributes_for :patient_histories, :allow_destroy => true
	accepts_nested_attributes_for :patient_clinical_information
	accepts_nested_attributes_for :telephones, :allow_destroy => true

	validates_presence_of :record, :name, :cpf, :rg, :sex, :color, :birth_date, :profession, :city, :state, :country, :fathers_name, :mothers_name, :marital_status, :health_insurance
	
	validates_numericality_of :record, :cpf, :rg
	
	validates_length_of :name, :within => 5..100
	validates_length_of :cpf, :is => 11
	validates_length_of :rg, :is => 10
  validates_length_of :sex, :maximum => 10
  validates_length_of :color, :maximum => 20
  validates_length_of :profession, :maximum => 50
  validates_length_of :city, :maximum => 100
  validates_length_of :state, :maximum => 50
  validates_length_of :country, :maximum => 100
  validates_length_of :fathers_name, :within => 5..100
  validates_length_of :mothers_name, :within => 5..100
  validates_length_of :marital_status, :maximum => 50
  validates_length_of :health_insurance_number, :maximum => 50
  
	validates_uniqueness_of :cpf, :rg
	
	validates_associated :health_insurance, :telephones, :addresses
	
  validate :should_not_have_birth_date_in_the_future
  validate :should_not_have_first_appointment_in_the_future
  validate :should_have_cpf_in_valid_format
  validate :should_have_rg_in_valid_format
  validate :should_have_at_least_one_address
  validate :should_have_at_least_one_telephone
    
  private

  def should_have_at_least_one_address
    unless addresses.any?{|a| !a.marked_for_destruction? }
      errors.add("A patient should have at least one address")
    end
  end
  
  def should_have_at_least_one_telephone
    unless telephones.any?{|t| !t.marked_for_destruction? }
      errors.add("A patient should have at least one telephone")
    end
  end

  def should_not_have_birth_date_in_the_future
    errors.add(:birth_date, "can't be in the future") if birth_date != nil && birth_date > Date.today
  end
  
  def should_not_have_first_appointment_in_the_future
    errors.add(:first_appointment, "can't be in the future") if first_appointment != nil && first_appointment > Date.today
  end
  
  def should_have_cpf_in_valid_format
    return errors.add(:cpf, "is invalid") if cpf_is_repeated?

    # ----------------------------------------------------
    # CPF first digit calculation
    first_digit = calculate_digit(sum_cpf_digits(10, 2))
    # ----------------------------------------------------

    # ----------------------------------------------------
    # CPF second digit calculation
    second_digit = calculate_digit(sum_cpf_digits(11, 3) + first_digit * 2) 
    # ----------------------------------------------------

    errors.add(:cpf, "is invalid") unless first_digit == cpf[9, 1].to_i && second_digit == cpf[10, 1].to_i
  end

  def should_have_rg_in_valid_format
    return errors.add(:rg, "is invalid") if rg_is_repeated?
  end

  def rg_is_repeated?
    is_repeated?(rg, 10)
  end

  def cpf_is_repeated?
     is_repeated?(cpf, 11)
  end

  def sum_cpf_digits(highest, lowest)
    digit_sum = 0
    highest.downto lowest do |i|
      digit_sum += cpf[highest-i, 1].to_i * i
    end
    digit_sum
  end

  def calculate_digit(sum)
    division_rest = sum % 11
    division_rest < 2 ? 0 : 11 - division_rest
  end

  # Checks if the value has only one number repeated <times> times    
  def is_repeated? (value, times)
    !((value =~ /^(\d)\1{#{times-1}}$/).nil?)
  end

end
