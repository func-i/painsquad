Feature: Survey

So that I can test getting a basic survey
I want to get a JSON survey

  Scenario: Fetching Survey that does not exist
    Given a saved survey
    When I hit the surveys path
    Then I should receive a 200 response code
    And the response should have the key survey
    And the survey hash should have the key questions

  Scenario: Fetching JSON Survey from API
    Given a saved survey
    When I hit the surveys path
    Then I should receive a 200 response code
    And the survey hash should have the key title
    And the survey title should be set

