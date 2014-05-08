'use strict'

@serviceModule.service 'SubmissionService', ['_', 'BodymapService', (_, BodymapService) ->

  # new singleton object
  init: (survey_id) ->
    @submission =
      survey_id:          survey_id
      has_pain:           null
      answers_attributes: []

  # retrieves singleton object
  getSubmission: () ->
    @submission

  # adds object to answer payload
  addAnswer: (answerObj) ->
    @submission.answers_attributes.push answerObj

  # answer object pre-requisite
  prepareAnswer: (answerObj, regionSelections = null) ->
    switch answerObj.question_type
      when 'checklist', 'radio', 'checklist-grid'
        @addSelectionAnswer(answerObj)
      when 'slider'
        @addSliderAnswer(answerObj)
      when 'textbox'
        @addTextboxAnswer(answerObj)
      when 'bodymap'
        @addBodymapAnswer(answerObj, regionSelections)
      when 'checklist-extra'
        console.log "TODO: Need to add answer parsing for #{answerObj.question_type}"
      when 'boolean'
        # do nothing
      else
        console.log "invalid question type detected: #{answerObj.question_type}"

  # adds choice_ids for basic selection questions
  addSelectionAnswer: (answerObj) ->
    selectedChoices = _.where(answerObj.choices, selected: true)
    if selectedChoices.length > 1
      @recursiveExtractAnswers(answerObj, selectedChoices)
    else
      resultObj =
        question_id: answerObj.question_id
        choice_id:   selectedChoices[0].id
        custom_text: selectedChoices[0].value
      @addAnswer(resultObj)

  # extracts items from selectedChoices and pushes to answers array
  recursiveExtractAnswers: (answerObj, selectedChoices) ->
    return unless selectedChoices.length
    item = selectedChoices.shift()
    resultObj =
      question_id: answerObj.question_id
      choice_id:   item.id
      custom_text: item.value
    @addAnswer(resultObj)
    @recursiveExtractAnswers(answerObj, selectedChoices)

  # adds integer 'value' to Answer for simple slider questions
  addSliderAnswer: (answerObj) ->
    resultObj =
      question_id: answerObj.question_id
      value:       parseInt(answerObj.choices[0].value)
    @addAnswer(resultObj)

  addTextboxAnswer: (answerObj) ->
    resultObj =
      question_id: answerObj.question_id
      custom_text: answerObj.choices[0].value
    @addAnswer(resultObj)

  addBodymapAnswer: (answerObj, regionSelections) ->
    resultObj =
      question_id: answerObj.question_id
      data_object: regionSelections
    @addAnswer(resultObj)

]
