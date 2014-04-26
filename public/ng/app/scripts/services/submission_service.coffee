'use strict'


@serviceModule.service 'SubmissionService', [ () ->

  # creates new singleton object
  init: () ->
    @submission = { answers: [] }

  # adds answer to singleton
  addAnswer: (value) ->
    @submission.answers.push value

  # retrieves singleton object
  getSubmission: () ->
    @submission

]
