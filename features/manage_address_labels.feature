Feature: Manage Address Labels
  In order to assign address labels to patient's addresses
  As a administrator
  I want to create and manage address labels

Background:
  Given I am logged in as thiago@medical_office.com with passsword thiago
  
  Scenario: Address Labels List
    Given an address_label exists with label: "Residencial"
    And an address_label exists with label: "Profissional"
    When I go to the address_labels list
    Then I should see "Residencial"
    And I should see "Profissional"
  
  Scenario: Create a Valid Address Label
    Given 0 address_labels exist
    And I am on the address_labels list
    And I follow "New Address Label"
    When I fill in "Label" with "Residencial"
    And I press "Create"
    Then I should see "Address Label was successfully created."
    And I should see "Residencial"
    And a address_label should exist
  
  Scenario: Try to Create an Invalid Address Label
    Given 0 address_labels exist
    And I am on the address_labels list
    And I follow "New Address Label"
    When I press "Create"
    Then I should see "error"
    And 0 address_labels should exist
    
  Scenario: Edit an Address Label
    Given an address_label exists
    And I am on the address_labels list
    When I follow "Edit"
    And I fill in "Label" with "Comercial"
    And I press "Update"
    Then I should see "Address Label was successfully updated."
    And I should see "Comercial"
    And a address_label should exist
    
  Scenario: Destroy an Address Label
    Given an address_label exists
    And I am on the address_labels list
    When I follow "Destroy"
    Then 0 address_labels should exist
