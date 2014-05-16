Feature: Submission

When a survey is filled out
And the Submission object is received
I want to ensure it can process all answers from the JSON response

  Scenario: When `has_pain` is false
    Given I post to "/api/submissions" with:
    """
    {
      "survey_id": 1,
      "has_pain": false,
      "answers_attributes": []
    }
    """


  Scenario: When `has_pain` is true
    Given I post to "/api/submissions" with:
    """
    {
      "survey_id": 1,
      "has_pain": true,
      "answers_attributes": []
    }
    """


  # Scenario: Fetching Survey that does exist
  #   Given a saved survey
  #   When I visit the surveys endpoint
  #   Then I should receive a 200 response code
  #     And the survey hash should have the key title
  #     And the survey hash should have the key questions and it should be a Array
  #     # And the survey hash should have the key title and it should equal survey.title
  #     # And the survey hash should have the key title and it should equal "Factory Survey"

  # Scenario: Fetching existing Survey, verify valid questions and choices
  #   Given a saved survey
  #   When I visit the surveys endpoint
  #   Then I should receive a 200 response code
  #     And the survey.questions hash should have the key title
  #     And the survey.questions hash should have the key choices
  #     And the survey.questions hash should have the key choices and it should be a Array
  #     # And the survey.questions hash should have the key choice_type and it should equal survey.questions[0].choice_type
  #     # And the survey.questions hash should have the key choice_type and it should equal "boolean"
