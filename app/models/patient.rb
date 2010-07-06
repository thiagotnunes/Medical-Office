class Patient < ActiveRecord::Base

	belongs_to :health_insurance
	has_many :telephones, :dependent => :destroy
	has_many :evolutions, :dependent => :destroy

	accepts_nested_attributes_for :telephones, :allow_destroy => true
	accepts_nested_attributes_for :evolutions, :allow_destroy => true, :reject_if => proc { |e| e['description'].nil? || e['description'].empty? }

	validates_presence_of :name, :cpf, :rg, :sex, :birth_date, :health_insurance_id, :address, :address_number
	validates_numericality_of :cpf, :rg
	validates_length_of :cpf, :is => 11
	validates_length_of :rg, :is => 10
  validates_length_of :name, :within => 5..100
  validates_length_of :sex, :maximum => 10
  validates_length_of :health_insurance_number, :maximum => 50
  validates_length_of :address, :maximum => 250
  validates_length_of :address_number, :maximum => 100
	validates_uniqueness_of :cpf, :rg
	validates_associated :health_insurance, :telephones
  validate :birth_date_should_not_be_in_the_future, :cpf_should_have_valid_format, :rg_should_have_valid_format
    
  private

  def birth_date_should_not_be_in_the_future
    errors.add(:birth_date, "can't be in the future") if birth_date != nil && birth_date > Date.today
  end

  def cpf_should_have_valid_format
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

  def rg_should_have_valid_format
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
