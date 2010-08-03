require 'spec_helper'

describe PatientClinicalInformation do

  it { should belong_to(:patient) }
  
  it { should validate_presence_of(:appointment_reason) }
  
  it { should ensure_length_of(:clazz).is_at_most(100) }
  it { should ensure_length_of(:injury_side).is_at_most(10) }
  it { should ensure_length_of(:injury_appraiser_physician).is_at_most(100) }
  it { should ensure_length_of(:evolution_time).is_at_most(100) }

  it "should be valid patient clinical information with valid attributes" do
		patient_clinical_information = Factory.build(:patient_clinical_information)
		patient_clinical_information.should be_valid
	end

end
