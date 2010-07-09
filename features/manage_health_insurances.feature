Feature: Manage Health Insurances
  In order to assign health insurances to patients
  As a administrator
  I want to create and manage health insurances

  Scenario: Health Insurances List
    Given the following health_insurances exists
    | name |
    | SUS |
    | Unimed |
    When I go to the health_insurances list
    Then I should see "SUS"
    And I should see "Unimed"

  Scenario: Create a Valid Health Insurance
    Given I have no health_insurances
    And I am on the health_insurances list
    And I follow "New Health Insurance"
    When I fill in "Name" with "Unimed"
    And I press "Create"
    Then I should see "Health Insurance was successfully created."
    And I should see "Unimed"
    And a health_insurance should exist

  Scenario: Try to Create an Invalid Health Insurance
    Given I have no health_insurances
    And I am on the health_insurances list
    And I follow "New Health Insurance"
    When I fill in "Name" with " "
    And I press "Create"
    Then I should see "error"

  Scenario: Edit a Health Insurance
    Given the following health_insurances exist
    | name |
    | SUS |
    And I am on the health_insurances list
    And I follow "Edit"
    When I fill in "Name" with "Unimed"
    And I press "Update"
    Then I should see "Health Insurance was successfully updated."
    And I should see "Unimed"
    And a health_insurance should exist

  Scenario: Destroy a Health Insurance
    Given the following health insurances exist
    | name |
    | SUS |
    And I am on the health_insurances list
    When I follow "Destroy"
    Then 0 health_insurances should exist
