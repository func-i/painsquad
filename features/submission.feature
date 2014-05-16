Feature: Submission

When a survey is filled out
And the Submission object is received
I want to ensure it can process all answers from the JSON response

  Scenario: survey_id is required
    Given an empty submission
    When I create the submission
    Then I should receive a 422 response code

  Scenario: has_pain is required
    Given an unsaved submission
    When I create the submission
    Then I should receive a 422 response code

  Scenario: A submission with survey and has_pain will succeed
    Given an unsaved submission
    When the submission field has_pain is set to false
    Then I create the submission
    Then I should receive a 200 response code
      And the response should have the key submission
      And the submission hash should have the key answers_attributes and it should be a Array

  Scenario: A submissions' answers array should contain answers
    Given an unsaved submission
    When the submission field has_pain is set to true
    Then I create the submission
    Then I should receive a 200 response code
      And I test the response
      # puts JSON
      # And the JSON at "submission.answers_attributes" should be 5

    # And the JSON response at "submission.answers_attributes/0" should be ""
    # Then the JSON at "submission.answers_attributes" should be ""
    # Then the submission.answers_attributes hash

      # And the submission hash should have the key answers_attributes and it should be a Array


  # Scenario: A submission with survey and has_pain
  #   Given an unsaved submission
  #   When the submission field has_pain is set to true
  #   Then I create the submission
  #   Then I should receive a 200 response code
  #     And the response should have the key submission
