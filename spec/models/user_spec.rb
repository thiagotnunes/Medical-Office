require 'spec_helper'

describe User do
  
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :role }
  
  it "should be valid user with valid email, password and role" do
    user = Factory.build(:user)
    user.should be_valid
  end
  
end
