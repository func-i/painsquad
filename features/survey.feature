Feature: Survey

So that I can fill out a survey
I want to visit /api/surveys
And receive a JSON survey object

  Scenario: Fetching Survey that does not exist
    Given an unsaved survey
    When I visit the surveys endpoint
    Then I should receive a 404 response code

  Scenario: Fetching Survey that does exist
    Given a saved survey
    When I visit the surveys endpoint
    Then I should receive a 200 response code
      And the response should have the key survey
      And the survey hash should have the key title
      And the survey title should be set
      And the survey hash should have the key questions and it should be a Array

  Scenario: Fetching existing Survey, verify valid questions and choices
    Given a saved survey
    When I visit the surveys endpoint
    Then I should receive a 200 response code
      And the survey.questions hash should have the key title
      And the survey.questions hash should have the key choices
      And the survey.questions hash should have the key choices and it should be a Array
      And the survey.questions hash should have the key choice_type and it should equal "boolean"
