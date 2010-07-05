require 'spec_helper'

describe Telephone do
	fixtures :telephones

  before(:each) do
    @telephone = Telephone.new
    @telephone.patient_id = 1
    @telephone.telephone_label_id = 1
  end

  it "should be invalid telephone with an empty number" do
    @telephone.number = nil
    @telephone.should_not be_valid
    @telephone.number = ''
    @telephone.should_not be_valid
  end

  it "should be invalid telephone with a number smaller than 6 characters" do
    @telephone.number = ''
    5.times { @telephone.number += '1' }
    @telephone.should_not be_valid
  end

  it "should be invalid telephone with a number bigger than 50 characters" do
    @telephone.number = ''
    51.times { @telephone.number += '1' }
    @telephone.should_not be_valid
  end

  it "should be valid telephone with existing number" do
    @telephone.number = "33445566"
    @telephone.should be_valid
  end

  it "should be valid telephone with non-existing number" do
    @telephone.number = "00998877"
    @telephone.should be_valid
  end

end
