Feature: Survey

So that I can test getting a basic survey
I want to get a JSON survey

  Scenario: Fetching Survey that does not exist
    Given I hit the surveys path
    Then I should receive a 200 response code
      And the response should have the key surveys
      And the surveys hash should be an array

  Scenario: Fetching JSON Survey from API
    Given a saved survey
    When I hit the surveys path
    Then I should receive a 200 response code
      And the surveys hash should have the key title
      And the first surveys title should be set

