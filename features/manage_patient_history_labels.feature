Feature: Manage Patient History Labels
  In order to assign history labels to patient's histories
  As a administrator
  I want to create and manage patient history labels

Background:
  Given I am logged in as thiago@medical_office.com with passsword thiago
  
  Scenario: Patient History Labels List
    Given a patient_history_label exists with label: "Medico"
    When I go to the patient_history_labels list
    Then I should see "Medico"
    And a patient_history_label should exist
    
  Scenario: Create a Valid Patient History Label
    Given 0 patient_history_labels exist
    And I am on the patient_history_labels list
    And I follow "New Patient History Label"
    When I fill in "Label" with "Medico"
    And I press "Create"
    Then I should see "Patient History Label was successfully created."
    And I should see "Medico"
    And a patient_history_label should exist
    
  Scenario: Try to Create an Invalid Patient
    Given a patient_history_label exists with label: "Medico"
    And I am on the patient_history_labels list
    And I follow "New Patient History Label"
    When I fill in "Label" with "Medico"
    And I press "Create"
    Then I should see "error"
    And 1 patient_history_labels should exist
    
  Scenario: Edit a Patient History Label
    Given a patient_history_label exists
    And I am on the patient_history_labels list
    And I follow "Edit"
    When I fill in "Label" with "Pessoal"
    And I press "Update"
    Then I should see "Patient History Label was successfully updated."
    And I should see "Pessoal"
    And a patient_history_label should exist

  Scenario: Destroy a Patient History Label
    Given a patient_history_label exists
    And I am on the patient_history_labels list
    When I follow "Destroy"
    Then 0 patient_history_labels should exist
