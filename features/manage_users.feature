Feature: 
  In order to give access to the system
  As an administrator
  I want to create and manage users

Background:
  Given I am logged in as thiago@medical_office.com with passsword thiago
  
  Scenario: Users list
    Given an user exists with email: "dermatology@medical_office.com"
    And an user exists with email: "plastic@medical_office.com"
    When I am on the users list
    Then I should see "dermatology@medical_office.com"
    And I should see "plastic@medical_office.com"
    
  Scenario: Create a Valid User
    Given I am on the users list
    And a user exists
    And a role exists with name: "admin"
    When I follow "New User"
    And I fill in "Email" with "dermatology@medical_office.com"
    And I fill in "Password" with "dermatology"
    And I fill in "Password confirmation" with "dermatology"
    And I select "admin" from "Role"
    And I press "Create"
    Then I should see "User was successfully created."
    And I should see "dermatology@medical_office.com"
    
  Scenario: Try to Create an Invalid User
    Given I am on the users list
    And a user exists
    And a role exists with name: "admin"
    When I follow "New User"
    And I fill in "Email" with "dermatology@medical_office.com"
    And I fill in "Password" with "dermatology"
    And I fill in "Password confirmation" with "dermatology"
    And I press "Create"
    Then I should see "error"
    
  Scenario: Edit my Own Password
    Given I am on the users list
    When I follow "Edit my Password"
    And I fill in "Password" with "lalala"
    And I fill in "Password confirmation" with "lalala"
    And I press "Update"
    Then I should see "Password was successfully updated."
    
  Scenario: Edit my Own Password with Different Password / Password Confirmation
    Given I am on the users list
    When I follow "Edit my Password"
    And I fill in "Password" with "lalala"
    And I fill in "Password confirmation" with "lalal"
    And I press "Update"
    Then I should see "error"
    
  Scenario: Destroy a User
    Given an user exists with email: "dermatology@medical_office.com"
    And I am on the users list
    When I follow "Destroy"
    Then a user should exist
