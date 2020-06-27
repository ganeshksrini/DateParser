Feature: User inputs date and returns date matches user intention
  Scenario Outline: User input 4 digit year pattern with month variations
    Given a user goes to website
    When enter <query> on input field
    And click submit
    Then I see "Sun Aug 16 2020 00:00:00 GMT+0000" on the form
    Examples:
    |query|
    |"16-august-2020"|
    |"16-aug-2020"|
    |"16-08-2020" |
    |"16-8-2020"  |