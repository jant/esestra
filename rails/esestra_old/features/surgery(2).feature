Feature: Surgeries list
  As a patient
  I want to see surgeries list
  So that I can make order

  Scenario: Surgeries list
    Given I am not yet using system
    When I go to the main page
    Then I should see "Ordinace"
    And I should see "ORL"