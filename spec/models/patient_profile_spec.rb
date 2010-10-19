require 'spec_helper'

describe PatientProfile do

  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(6).is_at_most(50) }

  it "should be valid patient profile with valid name" do
    patient_profile = Factory.build(:patient_profile)
    patient_profile.should be_valid
  end

end
