require 'spec_helper'

describe AddressLabel do
  
  it { should have_many(:addresses) }
  
  subject { Factory.create(:address_label) }
  
  it { should validate_presence_of(:label) }
  it { should validate_uniqueness_of(:label) }
  it { should ensure_length_of(:label).is_at_least(4).is_at_most(100) }

	it "should be valid address label with valid attributes" do
	  address_label = Factory.create(:address_label)
		address_label.should be_valid
	end

end