Feature: Manage Patients
  In order to keep a patient registry
  As a administrator
  I want to create and manage patients

  Scenario: Patient List
    Given the following patients exist
      | name            | cpf         | rg         | birth_date | sex  | address | address_number | health_insurance_number | 
      | Thiago da Silva | 93747868690 | 1234567890 | 1984-09-10 | Male | Address | 123            | 1234567890              | 
      | Joao da Silva   | 39095952274 | 2345678901 | 1985-09-11 | Male | Address | 123            | 1234567890              | 
    When I am on the patients list
    Then I should see "Thiago"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Joao"
    And I should see "39095952274"
    And I should see "2345678901"

  @current
  Scenario: Create a Valid Patient
    Given 0 patients exist
    And the following health_insurances exist
      | name   | 
      | SUS    | 
      | Unimed | 
    And I am on the patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Address                 | Address         | 
      | Address number          | 1234, ap. 123   | 
      | Health insurance number | 123456          | 
    And I select "Male" from "Sex"
    And I select "1984-09-10" as the "Patient birth date" date
    And I select "SUS" from "Health insurance"
    And I press "Create"
    Then I should see "Patient was successfully created."
    And I should see "Thiago da Silva"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Address"
    And I should see "1234, ap. 123"
    And I should see "123456"
    And a patient should exist

  Scenario: Try to Create an Invalid Patient
    Given 0 patients exist
    And the following health_insurances exist
      | name   | 
      | SUS    | 
      | Unimed | 
    And I am on the patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 12345678901     | 
      | Rg                      | 1234567890      | 
      | Address                 | Address         | 
      | Address number          | 1234, ap. 123   | 
      | Health insurance number | 123456          | 
    And I select "Male" from "Sex"
    And I select "1984-09-10" as the "Patient birth date" date
    And I select "SUS" from "Health insurance"
    And I press "Create"
    Then I should see "error"
    And 0 patients should exist

  Scenario: Edit a Patient
    Given the following patients exist
      | name            | cpf         | rg         | birth_date | sex  | address | address_number | health_insurance_number | 
      | Thiago da Silva | 93747868690 | 1234567890 | 1984-09-10 | Male | Address | 123            | 1234567890              | 
    And I am on the patients list
    And I follow "Edit"
    When I fill in "Cpf" with "22233366638"
    And I press "Update"
    Then I should see "Patient was successfully updated."
    And I should see "Thiago da Silva"
    And I should see "22233366638"
    And I should see "1234567890"
    And I should see "Address"
    And I should see "123"
    And I should see "123456"
    And a patient should exist

  Scenario: Destroy a Patient
    Given the following patients exist
      | name            | cpf         | rg         | birth_date | sex  | address | address_number | health_insurance_number | 
      | Thiago da Silva | 93747868690 | 1234567890 | 1984-09-10 | Male | Address | 123            | 1234567890              |
    And I am on the patients list
    When I follow "Destroy"
    Then 0 patients should exist
