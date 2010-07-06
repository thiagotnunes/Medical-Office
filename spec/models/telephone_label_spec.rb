require 'spec_helper'

describe TelephoneLabel do

  it { should have_many(:telephones) }

  subject { Factory.create(:telephone_label) }

  it { should validate_presence_of(:label) }
  it { should validate_uniqueness_of(:label) }
  it { should ensure_length_of(:label).is_at_least(5).is_at_most(50)  }

	it "should be valid telephone label with non-existing label" do
		telephone_label = Factory.build(:telephone_label)
		telephone_label.should be_valid
	end

end
