Feature: User inputs date as month at the begining and returns appropriate date
  Scenario Outline: User input 2 digit month at the beginning as mm-dd-yyyy
    Given user goes to website
    When enter <mdate> as beginning specific format on the input field and submit
    Then I see correct <mdate> on the form
    Examples:
      |mdate|
      |6-5-2020|
      |04/13/2020|
      |05 12 2020|