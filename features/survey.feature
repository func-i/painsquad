Feature: Survey

So that I can fill out a survey
I want to visit /api/surveys
And receive a JSON survey object

  Scenario: Fetching Survey that does not exist
    Given an unsaved survey
    When I hit the surveys path
    Then I should receive a 404 response code

  Scenario: Fetching Survey from API
    Given a saved survey
    When I hit the surveys path
    Then I should receive a 200 response code
      And the response should have the key survey
      And the survey hash should have the key title
      And the survey title should be set
      And the survey hash should have the key questions and it should be a Array
