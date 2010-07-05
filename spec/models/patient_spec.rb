require 'spec_helper'

describe Patient do
  
  before(:each) do
    @patient = Patient.new
    @patient.name = "Name surname"
    @patient.cpf = "22233366638"
    @patient.rg = "1234567890"
    @patient.sex = "Male"
    @patient.birth_date = Date.today
    @patient.address = "Address"
    @patient.address_number = "123"
    @patient.health_insurance_number = "123"
    @patient.health_insurance_id = 1 
    @patient.save!

    @patient = Patient.new
    @patient.name = "Name surname"
    @patient.cpf = "22233344405"
    @patient.rg = "0123456789"
    @patient.sex = "Male"
    @patient.birth_date = Date.today
    @patient.address = "Address"
    @patient.address_number = "123"
    @patient.health_insurance_number = "123"
    @patient.health_insurance_id = 1 
  end

  it "should be invalid patient with an empty name" do
    @patient.name = nil
    @patient.should_not be_valid
    @patient.name = ''
    @patient.should_not be_valid
  end

  it "should be invalid patient with non-numerical cpf" do
    @patient.cpf = "123abc123ab"
    @patient.should_not be_valid
  end

  it "should be invalid patient with non-numerical rg" do
    @patient.rg = "123abc123a"
    @patient.should_not be_valid
  end

  it "should be invalid patient with cpf length different than 11 numbers" do
    @patient.cpf = "2223336663"
    @patient.should_not be_valid
    @patient.cpf = "222333666381"
    @patient.should_not be_valid
  end

  it "should be invalid patient with rg length different than 10 numbers" do
    @patient.rg = "012345678"
    @patient.should_not be_valid
    @patient.rg = "01234567890"
    @patient.should_not be_valid
  end

  it "should be invalid patient with invalid rg" do
    @patient.rg = "2222222222"
    @patient.should_not be_valid
  end

  it "should be invalid patient with invalid cpf" do
    @patient.cpf = "22222222222"
    @patient.should_not be_valid
    @patient.cpf = "01234567891"
    @patient.should_not be_valid
  end

  it "should be invalid patient with existing cpf" do
    @patient.cpf = "22233366638"
    @patient.should_not be_valid
  end

  it "should be invalid patient with existing rg" do
    @patient.rg = "1111111111"
    @patient.should_not be_valid
  end

  it "should be invalid patient with an empty sex" do
    @patient.sex = nil
    @patient.should_not be_valid
    @patient.sex = ''
    @patient.should_not be_valid
  end

  it "should be invalid patient with an empty birth date" do
    @patient.birth_date = nil
    @patient.should_not be_valid
  end

  it "should be invalid patient with a birth date on the future" do
    @patient.birth_date = Date.today + 1
    @patient.should_not be_valid
  end

  it "should be invalid patient with a name bigger than 100 characters" do
    @patient.name = ''
    101.times { @patient.name += 'a' }
    @patient.should_not be_valid
  end

  it "should be invalid patient with a name smaller than 5 characters" do
    @patient.name = ''
    4.times { @patient.name += 'a' }
    @patient.should_not be_valid
  end

  it "should be invalid patient with a sex bigger than 10 characters" do
    @patient.sex = ''
    11.times { @patient.sex += 'a' }
    @patient.should_not be_valid
  end

  it "should be invalid patient with a health insurance number bigger than 51 characters" do
    @patient.health_insurance_number = ''
    51.times { @patient.health_insurance_number += 'a' }
    @patient.should_not be_valid
  end

  it "should be invalid patient with a address bigger than 251 characters" do
    @patient.address = ''
    251.times { @patient.address += 'a' }
    @patient.should_not be_valid
  end

  it "should be invalid patient with a address number bigger than 100 characters" do
    @patient.address_number = ''
    101.times { @patient.address_number += 'a' }
    @patient.should_not be_valid
  end

  it "should be valid patient with valid attributes" do
    @patient.should be_valid
  end

end
