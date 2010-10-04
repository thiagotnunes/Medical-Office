require 'spec_helper'

describe PlasticSurgeryPatient do
  
  it "should be valid plastic surgery therapy patient with valid attributes" do
    patient = Factory.build(:plastic_surgery_patient)
    patient.should be_valid
  end
  
end
