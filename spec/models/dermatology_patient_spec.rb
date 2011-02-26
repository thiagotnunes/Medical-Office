require 'spec_helper'

describe DermatologyPatient do
  
  it { should validate_presence_of(:main_complaint) }
  
  it "should be valid dermatology patient with valid attributes" do
    patient = Factory.build(:dermatology_patient)
    patient.should be_valid
  end
  
end
