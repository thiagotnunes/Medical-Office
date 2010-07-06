require 'spec_helper'

describe TelephoneLabel do

  subject { Factory.create(:telephone_label) }

  it { should validate_presence_of(:label) }
  it { should validate_uniqueness_of(:label) }
  it { should_not allow_value('a' * 4).for(:label) }
  it { should_not allow_value('a' * 51).for(:label) }

	it "should be valid telephone label with non-existing label" do
		telephone_label = Factory.build(:telephone_label)
		telephone_label.should be_valid
	end

end
