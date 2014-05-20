Feature: Submission

When a survey is filled out
And the Submission object is received
I want to ensure it can process all answers from the JSON response

  Scenario: A submission without survey and has_pain will fail
    Given an empty submission
    When I create the submission
    Then I should receive a 422 response code

  Scenario: A submission with survey_id and has_pain will succeed
    Given an unsaved submission
    When the submission field has_pain is set to false
    Then I create the submission
    Then I should receive a 200 response code
      And the response should have the key submission
      And the submission hash should have the key answers_attributes and it should be a Array

  Scenario: A submissions' answers_attributes array should contain valid answers
    Given a saved submission
    Then I create the submission
    Then I should receive a 200 response code
      And the JSON at "submission.answers_attributes" should be length 5
      And the first entry at "submission.answers_attributes" should have the key submission_id
      And the first entry at "submission.answers_attributes" should have the key choice_id
      And the first entry at "submission.answers_attributes" should have the key question_id
      And the first entry at "submission.answers_attributes" should have the key value
      And the first entry at "submission.answers_attributes" should have the key custom_text
      And the first entry at "submission.answers_attributes" should have the key data_object
