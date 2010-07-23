Feature: Manage Plastic Surgery Patients
  In order to keep a plastic surgery patient registry
  As a administrator
  I want to create and manage plastic surgery patients

  @current
  Scenario: Patient List
    Given the following plastic_surgery_patients exist
      | name            | sex  | cpf         | rg         | color | birth_date | profession | city | state | country | marital_status  | health_insurance | health_insurance_number | 
      | Thiago da Silva | Male | 93747868690 | 1234567890 | caucasian | 1984-09-10 | programmer | Porto Alegre | RS | Brazil | single | 1 | 1234567890              | 
      | Joao da Silva   | Male | 39095952274 | 2345678901 | black | 1985-09-11 | physician | New York | NY | USA | married | 1 | 1234567890              | 
    When I am on the plastic_surgery_patients list
    Then I should see "Thiago"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Joao"
    And I should see "39095952274"
    And I should see "2345678901"

  Scenario: Create a Valid Plastic Surgery Patient
    Given 0 plastic_surgery_patients exist
    And the following health_insurances exist
      | name   | 
      | SUS    | 
      | Unimed | 
    And I am on the plastic_surgery_patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Color | Caucasian |
      | Birth date              | 10.09.1984      | 
      | Profession | programmer |
      | City | Porto Alegre | 
      | Country | Brazil |
      | Marital status | single |
      | Address                 | Address         | 
      | Address number          | 1234, ap. 123   | 
      | Health insurance number | 123456          | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "SUS" from "Health insurance"
    And I press "Create"
    Then I should see "Patient was successfully created."
    And I should see "Thiago da Silva"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Address"
    And I should see "1234, ap. 123"
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
      | Birth date              | 10.09.1984      | 
      | Address                 | Address         | 
      | Address number          | 1234, ap. 123   | 
      | Health insurance number | 123456          | 
    And I select "Male" from "Sex"
    And I select "SUS" from "Health insurance"
    And I press "Create"
    Then I should see "error"
    And 0 plastic_surgery_patients should exist

  Scenario: Edit a Plastic Surgery Patient
    Given the following plastic_surgery_patients exist
      | name            | sex  | cpf         | rg         | color | birth_date | profession | city | state | country | marital_status | address | address_number | health_insurance_number | 
      | Thiago da Silva | Male | 93747868690 | 1234567890 | caucasian | 1984-09-10 | programmer | Porto Alegre | RS | Brazil | single | Address | 123            | 1234567890              | 
    And I am on the plastic_surgery_patients list
    And I follow "Edit"
    When I fill in "Cpf" with "22233366638"
    And I press "Update"
    Then I should see "Patient was successfully updated."
    And I should see "Thiago da Silva"
    And I should see "Male"
    And I should see "22233366638"
    And I should see "1234567890"
    And I should see "caucasian"
    And I should see "programmer"
    And I should see "Porto Alegre"
    And I should see "RS"
    And I should see "Brazil"
    And I should see "single"
    And I should see "Address"
    And I should see "123"
    And I should see "1234567890"
    And a plastic_surgery_patient should exist

  Scenario: Destroy a Plastic Surgery Patient
    Given the following plastic_surgery_patients exist
      | name            | sex  | cpf         | rg         | color | birth_date | profession | city | state | country | marital_status | address | address_number | health_insurance_number | 
      | Thiago da Silva | Male | 93747868690 | 1234567890 | caucasian | 1984-09-10 | programmer | Porto Alegre | RS | Brazil | single | Address | 123            | 1234567890              | 
    And I am on the plastic_surgery_patients list
    When I follow "Destroy"
    Then 0 plastic_surgery_patients should exist
