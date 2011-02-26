Feature: Manage Dermatology Patients
  In order to keep a dermatology patients registry
  As a dermatology physician and an administrator
  I want to create and manage dermatology patients

Background:
  Given I am logged in as thiago@medical_office.com with passsword thiago
  
  Scenario: Create a Valid Dermatology Patient
    Given 0 dermatology_patients exist
    And a health_insurance exists with name: "SUS"
    And a health_insurance exists with name: "Unimed"
    And an address_label exists with label: "Residencial"
    And an address_label exists with label: "Comercial"
    And a telephone_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And I am on the dermatology_patients list
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
      | Fathers name            | Joao da Silva   |
      | Mothers name            | Maria da Silva  |
      | Health insurance number | 0001112223      | 
      | Main complaint          | Pain            |
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "Brazil" from "Country"
    And I select "Single" from "Marital status"
    And I select "SUS" from "Health insurance"
    And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Dermatology Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Dermatology Patient"
    And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Dermatology Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Dermatology Patient"
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
    And I should see "Joao da Silva"
    And I should see "Maria da Silva"
    And I should see "Single"
    And I should see "SUS"
    And I should see "0001112223"
    And I should see "Residencial"
    And I should see "Street xyz"
    And I should see "Comercial"
    And I should see "33233232"
    And I should see "Pain"
    
  Scenario: Try to Create an Invalid Dermatology Patient
    Given 0 dermatology_patients exist
    And a health_insurance exists with name: "SUS"
    And a health_insurance exists with name: "Unimed"
    And an address_label exists with label: "Residencial"
    And an address_label exists with label: "Comercial"
    And a telephone_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And I am on the dermatology_patients list
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
      | Fathers name            | Joao da Silva   |
      | Mothers name            | Maria da Silva  |
      | Health insurance number | 0001112223      | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "Brazil" from "Country"
    And I select "Single" from "Marital status"
    And I select "SUS" from "Health insurance"
    And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Dermatology Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Dermatology Patient"
    And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Dermatology Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Dermatology Patient"
    And I press "Create"
    Then I should see "error"
    And 0 dermatology_patients should exist
    
  Scenario: Edit a Dermatology Patient
    Given 1 dermatology_patients exist
    And a health_insurance exists with name: "SUS"
    And a health_insurance exists with name: "Unimed"
    And an address_label exists with label: "Residencial"
    And an address_label exists with label: "Comercial"
    And a telephone_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And I am on the dermatology_patients list
    And I follow "Edit"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | First appointment       | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
      | Fathers name            | Joao da Silva   |
      | Mothers name            | Maria da Silva  |
      | Health insurance number | 0001112223      | 
      | Main complaint          | Pain            |
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "Brazil" from "Country"
    And I select "Single" from "Marital status"
    And I select "SUS" from "Health insurance"
    And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Dermatology Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Dermatology Patient"
    And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Dermatology Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Dermatology Patient"
    And I press "Update"
    Then I should see "Patient was successfully updated."
    And I should see "Thiago da Silva"
    And I should see "Male"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Caucasian"
    And I should see "Programmer"
    And I should see "Porto Alegre"
    And I should see "RS"
    And I should see "Brazil"
    And I should see "Joao da Silva"
    And I should see "Maria da Silva"
    And I should see "Single"
    And I should see "SUS"
    And I should see "0001112223"
    And I should see "Residencial"
    And I should see "Street xyz"
    And I should see "Comercial"
    And I should see "33233232"
    And I should see "Pain"
    
  Scenario: Destroy a Dermatology Patient
    Given a dermatology_patient exists
    And I am on the dermatology_patients list
    When I follow "Destroy"
    Then 0 dermatology_patients should exist
