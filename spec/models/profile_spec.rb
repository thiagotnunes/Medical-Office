require 'spec_helper'

describe Profile do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:is_patient) }
  it { should ensure_length_of(:name).is_at_least(6).is_at_most(50) }

  it "should be valid telephone with valid name and is patient flag" do
    profile = Factory.build(:profile)
    profile.should be_valid
  end

end
