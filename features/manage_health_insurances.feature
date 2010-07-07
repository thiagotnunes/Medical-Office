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
    And I should have 1 health insurances

  Scenario: Try to Create an Invalid Health Insurance
    Given I have no health insurances
    And I am on the health insurances list
    And I follow "New Health Insurance"
    When I fill in "Name" with " "
    And I press "Create"
    Then I should see "error"

  Scenario: Edit a Health Insurance
    Given I have health insurances named SUS
    And I am on the health insurances list
    And I follow "Edit"
    When I fill in "Name" with "Unimed"
    And I press "Update"
    Then I should see "Health Insurance was successfully updated."
    And I should see "Unimed"
    And I should have 1 health insurances

  Scenario: Destroy a Health Insurance
    Given I have health insurances named SUS
    And I am on the health insurances list
    When I follow "Destroy"
    Then I should have 0 health insurances
