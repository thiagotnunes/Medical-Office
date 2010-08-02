require 'spec_helper'

describe PatientTherapyInformation do

  it { should belong_to(:patient) }

  it { should validate_presence_of(:diagnosis) }

  it { should ensure_length_of(:diagnosis).is_at_most(250) }
  it { should ensure_length_of(:injury_appraiser_physician).is_at_most(250) }
  it { should ensure_length_of(:impaired_limb).is_at_most(250) }
  
  it "should be valid patient therapy information with valid attributes" do
    patient_theraphy_information = Factory.build(:patient_therapy_information)
    patient_theraphy_information.should be_valid
  end
  
end
