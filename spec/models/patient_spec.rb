require 'spec_helper'

describe Patient do

  it { should belong_to(:health_insurance) }
  it { should have_many(:telephones) }
  it { should have_many(:evolutions) }

  subject { Factory.create(:patient) }

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:cpf) }
  it { should validate_numericality_of(:rg) }
  it { should ensure_length_of(:cpf).is_equal_to(11) }
  it { should ensure_length_of(:rg).is_equal_to(10) }
  it { should_not allow_value('2' * 11).for(:cpf) }
  it { should_not allow_value('3' * 10).for(:rg) }
  it { should validate_uniqueness_of(:cpf) }
  it { should validate_uniqueness_of(:rg) }
  it { should validate_presence_of(:sex) }
  it { should validate_presence_of(:birth_date) }
  it { should ensure_length_of(:name).is_at_least(5).is_at_most(100) }
  it { should ensure_length_of(:sex).is_at_most(10) }
  it { should ensure_length_of(:health_insurance_number).is_at_most(50) }
  it { should ensure_length_of(:address).is_at_most(250) }
  it { should ensure_length_of(:address_number).is_at_most(100) }
  
  it "should be invalid patient with a birth date on the future" do
    patient = Factory.build(:patient, :birth_date => Date.today + 1)
    patient.should_not be_valid
  end

  it "should be valid patient with valid attributes" do
    patient = Factory.build(:patient)
    patient.should be_valid
  end

end
