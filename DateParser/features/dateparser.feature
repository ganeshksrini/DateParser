Feature: User inputs date and returns date matches user intention
  Scenario Outline: User input 4 digit year pattern with month variations
    Given a user goes to website
    When enter <query> on input field
    And click submit
    Then I see <query> on the form
    Examples:
    |query|
    |"16 aug 2020"   |
    |"20-august-2020"|
    |"18-aug-20"     |
    |"27-6-2020"     |

#   Scenario Outline: User input month at the beginning specific pattern
#     Given User goes to website
#     When enter <mdate> on input field
#     #And click submit
#     Then I see <mdate> on the form
#     Examples:
#     |mdate|
#     |"04-11-2020"|