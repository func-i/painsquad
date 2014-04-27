'use strict'

@serviceModule.service 'SubmissionService', [ () ->

  # creates new singleton object
  init: (survey_id) ->
    @submission =
      survey_id:          survey_id
      answers_attributes: []

  # adds answer to singleton
  addAnswer: (value) ->
    @submission.answers_attributes.push value

  # retrieves singleton object
  getSubmission: () ->
    @submission

]
