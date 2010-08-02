require 'spec_helper'

describe Address do
  
  it { should belong_to(:address_label) }
  it { should belong_to(:patient) }
  
  subject { Factory.create(:address) }
  
  it { should validate_presence_of(:location) }
  it { should ensure_length_of(:location).is_at_most(250) }

  it "should be valid address without a complement" do
	  address = Factory.create(:address)
	  address.complement = nil
		address.should be_valid
	end

	it "should be valid address with valid attributes" do
	  address = Factory.create(:address)
		address.should be_valid
	end

end