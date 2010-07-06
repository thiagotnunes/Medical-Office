require 'spec_helper'

describe HealthInsurance do
  
  subject { Factory.create(:health_insurance) }
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should_not allow_value('a' * 51).for(:name) }

	it "should be valid health insurance with a non-existing name" do
	  health_insurance = Factory.create(:health_insurance)
		health_insurance.should be_valid
	end

end
