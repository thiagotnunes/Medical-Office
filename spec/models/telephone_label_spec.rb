require 'spec_helper'

describe TelephoneLabel do

  before :each do
    @telephone_label = TelephoneLabel.new
    @telephone_label.label = 'Residencial'
    @telephone_label.save!

    @telephone_label = TelephoneLabel.new
  end

	it "should be invalid telephone label with an empty label" do
    @telephone_label.label = nil
		@telephone_label.should_not be_valid
		@telephone_label.label = ''
		@telephone_label.should_not be_valid
	end

	it "should be invalid telephone label with existing label" do
		@telephone_label.label = "Residencial"
		@telephone_label.should_not be_valid
	end

  it "should be invalid telephone label with a label bigger than 50 characters" do
    @telephone_label.label = ''
    51.times { @telephone_label.label += 'a' }
    @telephone_label.should_not be_valid
  end

  it "should be invalid telephone label with a label smaller than 5 characters" do
    @telephone_label.label = ''
    4.times { @telephone_label.label += 'a' }
    @telephone_label.should_not be_valid
  end

	it "should be valid telephone label with non-existing label" do
		@telephone_label.label = "Comercial"
		@telephone_label.should be_valid
	end

end
