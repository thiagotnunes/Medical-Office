require 'spec_helper'

describe Evolution do
  before(:each) do
    @evolution = Evolution.new
    @evolution.attendance_date = Date.today
    @evolution.description = "Description"
  end

  it "should be invalid evolution with empty attendance date" do
    @evolution.attendance_date = nil
    @evolution.should_not be_valid
  end

  it "should be invalid evolution with empty description" do
    @evolution.description = nil
    @evolution.should_not be_valid
    @evolution.description = ''
    @evolution.should_not be_valid
  end

  it "should be valid evolution" do
    @evolution.should be_valid
  end
end
