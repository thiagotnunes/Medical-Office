require 'spec_helper'

describe HealthInsurance do
	before :each do
    Factory.create(:health_insurance)

		@health_insurance = Factory.create(:health_insurance, :name => "IP")
	end

	it "should be invalid health insurance with an empty a name" do
		@health_insurance.name = nil
		@health_insurance.should_not be_valid
    @health_insurance.name = ''
		@health_insurance.should_not be_valid
	end

	it "should be invalid health insurance with existing name" do
		@health_insurance.name = "SUS"
		@health_insurance.should be_invalid
	end

  it "should be invalid health insurance with a name bigger than 50 characters" do
    @health_insurance.name = ''
    51.times { @health_insurance.name += 'a' }
    @health_insurance.should_not be_valid
  end

	it "should be valid health insurance with a non-existing name" do
		@health_insurance.should be_valid
	end

end
