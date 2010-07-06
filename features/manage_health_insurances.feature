Feature: Manage Health Insurances
  In order to assign health insurances to patients
  As a administrator
  I want to create and manage health insurances

  Scenario: Health Insurances List
    Given I have health insurances named SUS, Unimed
    When I am on the health insurances list
    Then I should see "SUS"
    And I should see "Unimed"

  Scenario: Create a Valid Health Insurance
    Given I have no health insurances
    And I am on the health insurances list
    And I follow "New Health Insurance"
    When I fill in "Name" with "Unimed"
    And I press "Create"
    Then I should see "Health Insurance was successfully created."
    And I should see "Unimed"
    And I should have 1 health insurance
    
