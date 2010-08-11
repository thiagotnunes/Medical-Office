@current
Feature: Manage Occupational Therapy Patients
  In order to keep a occupational therapy patients registry
  As a occupational therapy physician and an administrator
  I want to create and manage occupational therapy patients
  
  Scenario: Create a Valid Occupational Therapy Patient
    Given 0 occupational_therapy_patients exist
    And a health_insurance exists with name: "SUS"
    And a health_insurance exists with name: "Unimed"
    And an address_label exists with label: "Residencial"
    And an address_label exists with label: "Comercial"
    And a telephone_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And I am on the occupational_therapy_patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
	    | Fathers name            | Joao da Silva   |
	    | Mothers name            | Maria da Silva  |
      | Health insurance number | 0001112223      | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "Brazil" from "Country"
    And I select "Single" from "Marital status"
    And I select "SUS" from "Health insurance"
	  And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Occupational Therapy Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Occupational Therapy Patient"
	  And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Occupational Therapy Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Occupational Therapy Patient"
    And I fill in the following of the "Patient Therapy Information" for the "Occupational Therapy Patient":
      | Diagnosis | Constant sadness |
      | Injury time | 5 |
      | Injury appraiser physician | John Doe |
      | Main complaint | Pain |
      | Disease history | No history |
      | Impaired limb | Left arm |
      | Dominance | All arm |
      | Adm | Adm |
      | Fm | Fm |
      | Sensibility | Harsh |
      | Aspect | Aspect |
      | Fo | Fo |
      | Circumference | 3.14 |
      | Avds | Avds |
      | Dnpm | Dnpm |
    And I fill in the following of the "Patient Surgery" 0 for the "Occupational Therapy Patient":
      | Evaluations results | bruises |
      | Indicated conduct | surgery |
      | CID | 1234 |
      | Surgery performed | Special Surgery |
      | Surgery date | 10.09.2009 |
      | Surgery performed at | Hospital |
      | Surgery anesthethist | Jose da Silva |
      | Surgery description | It went well |
      | PO imediate result | ok |
      | Intercurrences | No intercurrences |
      | Pathology material | No pathology material |
      | Pathology result | No pathology result |
      | Diagnosis | Disease |
    And I press "Create"
    Then I should see "Patient was successfully created."
    And I should see "Thiago da Silva"
    And I should see "Male"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Caucasian"
    And I should see "Programmer"
    And I should see "Porto Alegre"
    And I should see "RS"
    And I should see "Brazil"
    And I should see "Joao da Silva"
    And I should see "Maria da Silva"
    And I should see "Single"
    And I should see "SUS"
    And I should see "0001112223"
    And I should see "Residencial"
    And I should see "Street xyz"
    And I should see "Comercial"
    And I should see "33233232"
    And I should see "Constant sadness"
    And I should see "5"
    And I should see "John Doe"
    And I should see "Pain"
    And I should see "No history"
    And I should see "Left arm"
    And I should see "All arm"
    And I should see "Adm"
    And I should see "Fm"
    And I should see "Harsh"
    And I should see "Aspect"
    And I should see "Fo"
    And I should see "3.14"
    And I should see "Avds"
    And I should see "Dnpm"
    And I should see "bruises"
    And I should see "surgery"
    And I should see "1234"
    And I should see "Special Surgery"
    And I should see "Hospital"
    And I should see "Jose da Silva"
    And I should see "It went well"
    And I should see "ok"
    And I should see "No intercurrences"
    And I should see "No pathology material"
    And I should see "No pathology result"
    And I should see "Disease"
    And an occupational_therapy_patient should exist
    
  Scenario: Try to Create an Invalid Occupational Therapy Patient
    Given 0 occupational_therapy_patients exist
    And a health_insurance exists with name: "SUS"
    And a health_insurance exists with name: "Unimed"
    And an address_label exists with label: "Residencial"
    And an address_label exists with label: "Comercial"
    And a telephone_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And I am on the occupational_therapy_patients list
    And I follow "New Patient"
    When I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
	    | Fathers name            | Joao da Silva   |
	    | Mothers name            | Maria da Silva  |
      | Health insurance number | 0001112223      | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "Brazil" from "Country"
    And I select "Single" from "Marital status"
    And I select "SUS" from "Health insurance"
	  And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Occupational Therapy Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Occupational Therapy Patient"
	  And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Occupational Therapy Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Occupational Therapy Patient"
    And I fill in the following of the "Patient Therapy Information" for the "Occupational Therapy Patient":
      | Injury time | 5 |
      | Injury appraiser physician | John Doe |
      | Main complaint | Pain |
      | Disease history | No history |
      | Impaired limb | Left arm |
      | Dominance | All arm |
      | Adm | Adm |
      | Fm | Fm |
      | Sensibility | Harsh |
      | Aspect | Aspect |
      | Fo | Fo |
      | Circumference | 3.14 |
      | Avds | Avds |
      | Dnpm | Dnpm |
    And I fill in the following of the "Patient Surgery" 0 for the "Occupational Therapy Patient":
      | Evaluations results | bruises |
      | Indicated conduct | surgery |
      | CID | 1234 |
      | Surgery performed | Special Surgery |
      | Surgery date | 10.09.2009 |
      | Surgery performed at | Hospital |
      | Surgery anesthethist | Jose da Silva |
      | Surgery description | It went well |
      | PO imediate result | ok |
      | Intercurrences | No intercurrences |
      | Pathology material | No pathology material |
      | Pathology result | No pathology result |
      | Diagnosis | Disease |
    And I press "Create"
    Then I should see "error"
    And 0 occupational_therapy_patients should exist
    
   Scenario: Edit an Occupational Therapy Patient
    Given a health_insurance exists with name: "SUS"
    And an address_label exists with label: "Residencial"
    And a telephone_label exists with label: "Comercial"
    And a occupational_therapy_patient exists
    And I am on the occupational_therapy_patients list
    When I follow "Edit"
    And I fill in the following:
      | Name                    | Thiago da Silva | 
      | Cpf                     | 93747868690     | 
      | Rg                      | 1234567890      | 
      | Color                   | Caucasian       |
      | Birth date              | 10.09.1984      | 
      | Profession              | Programmer      |
      | City                    | Porto Alegre    | 
	    | Fathers name            | Joao da Silva   |
	    | Mothers name            | Maria da Silva  |
      | Health insurance number | 0001112223      | 
    And I select "Male" from "Sex"
    And I select "RS" from "State"
    And I select "Brazil" from "Country"
    And I select "Single" from "Marital status"
    And I select "SUS" from "Health insurance"
	  And I select "Residencial" from the "Address Label" of the "Address" 0 for the "Occupational Therapy Patient"
    And I fill in "Location" of the "Address" 0 with "Street xyz" for the "Occupational Therapy Patient"
	  And I select "Comercial" from the "Telephone Label" of the "Telephone" 0 for the "Occupational Therapy Patient"
    And I fill in "Number" of the "Telephone" 0 with "33233232" for the "Occupational Therapy Patient"
    And I fill in the following of the "Patient Therapy Information" for the "Occupational Therapy Patient":
      | Diagnosis | Constant sadness |
    And I fill in the following of the "Patient Surgery" 0 for the "Occupational Therapy Patient":
      | Evaluations results | bruises |
      | Indicated conduct | surgery |
      | CID | 1234 |
      | Surgery performed | Special Surgery |
      | Surgery date | 10.09.2009 |
      | Surgery performed at | Hospital |
      | Surgery anesthethist | Jose da Silva |
      | Surgery description | It went well |
      | PO imediate result | ok |
      | Intercurrences | No intercurrences |
      | Pathology material | No pathology material |
      | Pathology result | No pathology result |
      | Diagnosis | Disease |
    Then show me the page
    And I should see "Patient was successfully updated."
    And I should see "Thiago da Silva"
    And I should see "Male"
    And I should see "93747868690"
    And I should see "1234567890"
    And I should see "Caucasian"
    And I should see "Programmer"
    And I should see "Porto Alegre"
    And I should see "RS"
    And I should see "Brazil"
    And I should see "Joao da Silva"
    And I should see "Maria da Silva"
    And I should see "Single"
    And I should see "SUS"
    And I should see "0001112223"
    And I should see "Residencial"
    And I should see "Street xyz"
    And I should see "Comercial"
    And I should see "33233232"
    And I should see "Constant sadness"
    And I should see "bruises"
    And I should see "surgery"
    And I should see "1234"
    And I should see "Special Surgery"
    And I should see "Hospital"
    And I should see "Jose da Silva"
    And I should see "It went well"
    And I should see "ok"
    And I should see "No intercurrences"
    And I should see "No pathology material"
    And I should see "No pathology result"
    And I should see "Disease"
    And an occupational_therapy_patient should exist
