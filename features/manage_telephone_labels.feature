Feature: Manage Telephone Labels
  In order to assign telephones labels to a patients 
  As a administrator
  I want to create and manage telephone labels

  Scenario: Telephone Labels List
    Given the following telephone_labels exist
    | label |
    | Residencial |
    | Comercial |
    When I am on the telephone_labels list
    Then I should see "Residencial"
    And I should see "Comercial"

  Scenario: Create a Valid Telephone Label
    Given I am on the telephone_labels list
    And I have no telephone_labels
    When I follow "New Telephone Label"
    And I fill in "Label" with "Residencial"
    And I press "Create"
    Then I should see "Telephone Label was successfully created."
    And I should see "Residencial"
    And a telephone_label should exist

  Scenario: Try to Create an Invalid Telephone Label
    Given I have no telephone_labels
    And I am on the telephone_labels list
    And I follow "New Telephone Label"
    When I fill in "Label" with " "
    And I press "Create"
    Then I should see "error"

  Scenario: Update a Telephone Label
    Given the following telephone_labels exist
    | label |
    | Residencial |
    And I am on the telephone_labels list
    When I follow "Edit"
    And I fill in "Label" with "Comercial"
    And I press "Update"
    Then I should see "Telephone Label was successfully updated."
    And I should see "Comercial"
    And a telephone_label should exist

  Scenario: Destroy a Telephone Label
    Given the following telephone_labels exist
      | label |
      | Residencial |
    And I am on the telephone_labels list
    When I follow "Destroy"
    Then 0 telephone_labels should exist

