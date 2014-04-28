'use strict'

@serviceModule.service 'SubmissionService', ["_", (_) ->

  # creates new singleton object
  init: (survey_id) ->
    @submission =
      survey_id:          survey_id
      answers_attributes: []

  # adds answer to singleton
  addAnswer: (value) ->
    selectedChoices = _.where(value.choices, selected: true)
    if selectedChoices.length > 1
      @recursiveExtractAnswers(value, selectedChoices)
    else
      @submission.answers_attributes.push
        question_id: value.question_id
        choice_id: selectedChoices[0].id

  # recursively extracts items from selectedChoices and pushes to answers array
  recursiveExtractAnswers: (value, selectedChoices) ->
    return unless selectedChoices.length
    item = selectedChoices.shift()
    answerObj =
      question_id: value.question_id
      choice_id:   item.id
    @submission.answers_attributes.push(answerObj)
    @recursiveExtractAnswers(value, selectedChoices)

  # retrieves singleton object
  getSubmission: () ->
    @submission

]
