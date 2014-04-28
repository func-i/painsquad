'use strict'

@serviceModule.service 'SubmissionService', ["_", (_) ->

  # creates new singleton object
  init: (survey_id) ->
    @submission =
      survey_id:          survey_id
      answers_attributes: []

  # adds answer to singleton
  addAnswer: (value) ->
    @submission.answers_attributes.push(@extractSelected(value))

  extractSelected: (value) ->
    value.choices = _.where(value.choices, selected: true)
    value

  # retrieves singleton object
  getSubmission: () ->
    @submission

]
