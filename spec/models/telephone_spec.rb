require 'spec_helper'

describe Telephone do

  it { should validate_presence_of(:number) }
  it { should_not allow_value('1' * 5).for(:number) }

  it "should be valid telephone with valid number" do
    telephone = Factory.build(:telephone)
    telephone.should be_valid
  end

end
