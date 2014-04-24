'use strict'

@serviceModule.factory 'SubmissionService', [ () ->
  submission = {
    answers: []
  }

  addAnswer: (value) ->
    if value and value not in submission.answers
      submission.answers.push(value)
    # debugger
    # submission.answers.pushUnlessExists(value)

  getSubmission: ->
    submission

  # Array::inArray = (comparison) ->
  #   i = 0
  #   while i < @length
  #     true if comparison(@[i])
  #     i++
  #   false

  # Array::pushUnlessExists = (element, comparison) ->
  #   @push.element unless @inArray(comparison)
]