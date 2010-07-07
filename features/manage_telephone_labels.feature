Feature: Manage Telephone Labels
  In order to assign telephones to a patient
  As a administrator
  I want to create and manage telephone labels

  Scenario: Telephone Labels List
    Given I have telephone labels labeled Residencial, Comercial
    When I am on the telephone labels list
    Then I should see "Residencial"
    And I should see "Comercial"

  Scenario: Create a Valid Telephone Label
    Given I am on the telephone labels list
    And I have no telephone labels
    When I follow "New Telephone Label"
    And I fill in "Label" with "Residencial"
    And I press "Create"
    Then I should see "Telephone Label was successfully created."
    And I should see "Residencial"
    And I should have 1 telephone label

  Scenario: Try to Create an Invalid Telephone Label
    Given I have no telephone labels
    And I am on the telephone labels list
    And I follow "New Telephone Label"
    When I fill in "Label" with " "
    And I press "Create"
    Then I should see "error"

  Scenario: Update a Telephone Label
    Given I have telephone labels labeled Residencial
    And I am on the telephone labels list
    When I follow "Edit"
    And I fill in "Label" with "Comercial"
    And I press "Update"
    Then I should see "Telephone Label was successfully updated."
    And I should see "Comercial"
    And I should have 1 telephone label

  Scenario: Destroy a Telephone Label
    Given I have telephone labels labeled Residencial
    And I am on the telephone labels list
    When I follow "Destroy"
    Then I should have 0 telephone label

