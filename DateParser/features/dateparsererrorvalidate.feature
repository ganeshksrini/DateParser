Feature: User input invalid dates and returns appropriate message
  Scenario Outline: User input invalid dates in dd-mm-yyyy format
    Given a user go to website
    When enter <idate> on date field
    And click submit
    Then I see error message "Invalid date" on form
    Examples:
    |idate|
    |21-abc-2020|
    |21-jun-june|
    |ab-aug-2020|
    |20-aug-$$20|
