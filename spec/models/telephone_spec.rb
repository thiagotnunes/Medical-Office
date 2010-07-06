require 'spec_helper'

describe Telephone do

  it { should belong_to(:patient) }
  it { should belong_to(:telephone_label) }

  it { should validate_presence_of(:number) }
  it { should ensure_length_of(:number).is_at_least(6).is_at_most(50) }

  it "should be valid telephone with valid number" do
    telephone = Factory.build(:telephone)
    telephone.should be_valid
  end

end
