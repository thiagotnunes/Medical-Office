require 'spec_helper'

describe PatientClinicalInformation do

  it { should belong_to(:patient) }

  it "should be valid patient clinical information with valid attributes" do
		patient_clinical_information = Factory.build(:patient_clinical_information)
		patient_clinical_information.should be_valid
	end

end
