Feature: Manage Patients
  In order to keep a patient registry
  As a administrator
  I want to create and manage patients

  Scenario: Patient List
    Given the following patients exist
      | name | cpf | rg | birth_date | sex | address | address_number | health_insurance_number |
      | Thiago da Silva | 93747868690 | 1234567890 | 1984-09-10 | Male | Address | 123 | 1234567890 |
      | Joao da Silva | 39095952274 | 2345678901 | 1985-09-11 | Male | Address | 123 | 1234567890 |
    When I am on the patients list
    Then I should see "Thiago"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Joao"
    And I should see "39095952274"
    And I should see "2345678901"
