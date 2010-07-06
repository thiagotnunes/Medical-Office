require 'spec_helper'

describe Patient do

  subject { Factory.create(:patient) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:cpf) }
  it { should validate_numericality_of(:rg) }
  it { should_not allow_value('1' * 10).for(:cpf) }
  it { should_not allow_value('1' * 12).for(:cpf) }
  it { should_not allow_value('1' * 9).for(:rg) }
  it { should_not allow_value('1' * 11).for(:rg) }
  it { should_not allow_value('2' * 11).for(:cpf) }
  it { should_not allow_value('3' * 10).for(:rg) }
  it { should validate_uniqueness_of(:cpf) }
  it { should validate_uniqueness_of(:rg) }
  it { should validate_presence_of(:sex) }
  it { should validate_presence_of(:birth_date) }
  it { should_not allow_value('a' * 4).for(:name) }
  it { should_not allow_value('a' * 101).for(:name) }
  it { should_not allow_value('a' * 11).for(:sex) }
  it { should_not allow_value('2' * 51).for(:health_insurance_number) }
  it { should_not allow_value('a' * 251).for(:address) }
  it { should_not allow_value('a' * 101).for(:address_number) }
  
  it "should be invalid patient with a birth date on the future" do
    patient = Factory.build(:patient, :birth_date => Date.today + 1)
    patient.should_not be_valid
  end

  it "should be valid patient with valid attributes" do
    patient = Factory.build(:patient)
    patient.should be_valid
  end

end
