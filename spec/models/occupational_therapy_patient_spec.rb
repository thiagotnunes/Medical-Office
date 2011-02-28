require 'spec_helper'

describe OccupationalTherapyPatient do
  
  it "should be valid occupational therapy patient with valid attributes" do
    patient = Factory.build(:occupational_therapy_patient)
    patient.should be_valid
  end
  
end
