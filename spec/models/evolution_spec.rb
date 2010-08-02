require 'spec_helper'

describe Evolution do
  
  it { should belong_to(:patient) }
  it { should have_many(:evolution_pictures) }
  
  it { should validate_presence_of(:attendance_date) }
  it { should validate_presence_of(:description) }
  
  it "should be valid evolution" do
    evolution = Factory.build(:evolution)
    evolution.should be_valid
  end
  
end
