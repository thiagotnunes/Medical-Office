Feature: Manage Plastic Surgery Patients
  In order to keep a plastic surgery patient registry
  As a administrator
  I want to create and manage plastic surgery patients

  Scenario: Patient List
    Given a plastic_surgery_patient exists with name: "Thiago", cpf: "22233366638", rg: "2080057852"
    When I am on the plastic_surgery_patients list
    Then I should see "Thiago"
	  And I should see "22233366638"
	  And I should see "2080057852"

  Scenario: Create a Valid Plastic Surgery Patient
    Given 0 plastic_surgery_patients exist
    And a health_insurance exists with name: "SUS"
    And a health_insurance exists with name: "Unimed"
    And an address_label exists with label: "Residencial"
    And an address_label exists with label: "Comercial"
    And a telephone_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And I am on the plastic_surgery_patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | First appointment       | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
      | Country                 | Brazil          |
	  | Fathers name            | Joao da Silva   |
	  | Mothers name            | Maria da Silva  |
      | Marital status          | single          |
      | Health insurance number | 1234567890      | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "SUS" from "Health insurance"
	And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Plastic Surgery Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Plastic Surgery Patient"
	And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Plastic Surgery Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Plastic Surgery Patient"
    And I press "Create"
    Then I should see "Patient was successfully created."
    And I should see "Thiago da Silva"
    And I should see "Male"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Caucasian"
    And I should see "Programmer"
    And I should see "Porto Alegre"
    And I should see "RS"
    And I should see "Brazil"
    And I should see "SUS"
    And I should see "123456"
    And a plastic_surgery_patient should exist

  Scenario: Try to Create an Invalid Plastic Surgery Patient
    Given 0 plastic_surgery_patients exist
    And the following health_insurances exist
      | name   | 
      | SUS    | 
      | Unimed | 
    And I am on the plastic_surgery_patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 12345678901     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
      | Country                 | Brazil          |
      | Marital status          | single          |
      | Health insurance number | 123456          | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "SUS" from "Health insurance"
    And I press "Create"
    Then I should see "error"
    And 0 plastic_surgery_patients should exist

  Scenario: Edit a Plastic Surgery Patient
    Given a health_insurance exists with name: "SUS"
    And an address_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And a plastic_surgery_patient exists
    And I am on the plastic_surgery_patients list
    And I follow "Edit"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 22233366638     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | First appointment       | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
      | Country                 | Brazil          |
      | Marital status          | single          |
      | Health insurance number | 1234567891      | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "SUS" from "Health insurance"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Plastic Surgery Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Plastic Surgery Patient"
    And I press "Update"
    Then I should see "Patient was successfully updated."
    And I should see "Thiago da Silva"
    And I should see "Male"
    And I should see "22233366638"
    And I should see "1234567890"
    And I should see "Caucasian"
    And I should see "Programmer"
    And I should see "Porto Alegre"
    And I should see "RS"
    And I should see "Brazil"
    And I should see "single"
    And I should see "SUS"
    And I should see "1234567891"
    And I should see "Street xyz"
    And I should see "33233232"
    And a plastic_surgery_patient should exist

  Scenario: Destroy a Plastic Surgery Patient
    Given a plastic_surgery_patient exists
    And I am on the plastic_surgery_patients list
    When I follow "Destroy"
    Then 0 plastic_surgery_patients should exist
