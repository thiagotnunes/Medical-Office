require 'spec_helper'

describe PatientHistory do

  it { should belong_to(:patient) }
  it { should belong_to(:patient_history_label) }

  it { should validate_presence_of(:history) }
  
  it "should be valid patient history with valid attributes" do
    patient_history = Factory.build(:patient_history)
    patient_history.should be_valid
  end
  
end
