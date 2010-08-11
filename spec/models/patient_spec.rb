require 'spec_helper'

describe Patient do

  it { should belong_to(:health_insurance) }
  
  it { should have_one(:patient_clinical_information) }
  it { should have_one(:patient_therapy_information) }
  
  it { should have_many(:addresses) }
  it { should have_many(:evolutions) }
  it { should have_many(:patient_histories) }
  it { should have_many(:patient_pictures) }
  it { should have_many(:patient_surgeries) }
  it { should have_many(:telephones) }

  subject { Factory(:patient) }

  it { should validate_presence_of(:record) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:rg) }
  it { should validate_presence_of(:sex) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:birth_date) }
  it { should validate_presence_of(:profession) }
  it { should validate_presence_of(:city) } 
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:fathers_name) }
  it { should validate_presence_of(:mothers_name) }
  it { should validate_presence_of(:marital_status) }
  it { should validate_presence_of(:health_insurance) }
  
  it { should validate_numericality_of(:record) }
  it { should validate_numericality_of(:cpf) }
  it { should validate_numericality_of(:rg) }
  
  it { should ensure_length_of(:name).is_at_least(5).is_at_most(100) }
  it { should ensure_length_of(:cpf).is_equal_to(11) }
  it { should ensure_length_of(:rg).is_equal_to(10) }
  it { should ensure_length_of(:sex).is_at_most(10) }
  it { should ensure_length_of(:color).is_at_most(20) }
  it { should ensure_length_of(:profession).is_at_most(50) }
  it { should ensure_length_of(:city).is_at_most(100) }
  it { should ensure_length_of(:state).is_at_most(50) }
  it { should ensure_length_of(:country).is_at_most(100) }
  it { should ensure_length_of(:fathers_name).is_at_least(5).is_at_most(100) }
  it { should ensure_length_of(:mothers_name).is_at_least(5).is_at_most(100) }
  it { should ensure_length_of(:marital_status).is_at_most(50) }
  it { should ensure_length_of(:health_insurance_number).is_at_most(50) }
  
  it { should validate_uniqueness_of(:cpf) }
  it { should validate_uniqueness_of(:rg) }
  
  it { should_not allow_value('2' * 11).for(:cpf) }
  it { should_not allow_value('3' * 10).for(:rg) }
  
  it "should be invalid patient with a birth date on the future" do
    patient = Factory.build(:patient, :birth_date => Date.today + 1)
    patient.should_not be_valid
  end
  
  it "should be invalid patient with a first appointment on the future" do
    patient = Factory.build(:patient, :first_appointment => Date.today + 1)
    patient.should_not be_valid
  end
  
  it "should be invalid patient without an address" do
    patient = Factory.build(:patient)
    patient.addresses = []
    patient.should_not be_valid
  end
  
  it "should be invalid patient without a telephone" do
    patient = Factory.build(:patient)
    patient.telephones = []
    patient.should_not be_valid
  end

  it "should be valid patient with valid attributes" do
    patient = Factory.build(:patient)
    patient.should be_valid
  end

end
