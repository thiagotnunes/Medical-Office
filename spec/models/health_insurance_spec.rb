require 'spec_helper'

describe HealthInsurance do
  
  it { should have_many(:patients) }
  
  subject { Factory.create(:health_insurance) }
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should ensure_length_of(:name).is_at_most(50) }

	it "should be valid health insurance with valid attributes" do
	  health_insurance = Factory.create(:health_insurance)
		health_insurance.should be_valid
	end

end
