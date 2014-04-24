'use strict'

@serviceModule.factory 'SubmissionService', [ () ->
  submission = {
    answers: []
  }

  addAnswer: (value) ->
    submission.answers.push(value)

  getSubmission: ->
    submission
]