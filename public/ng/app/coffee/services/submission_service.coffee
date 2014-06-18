'use strict'

@SubmissionService = @serviceModule.service 'SubmissionService', (BodymapService) ->

  # new singleton object
  init: (survey_id) ->
    @submission =
      survey_id:          survey_id
      has_pain:           null
      xp_points:          0
      answers_attributes: []

  # retrieves singleton object
  getSubmission: () ->
    @submission

  # adds object to answer payload
  addAnswer: (answerObj) ->
    @submission.answers_attributes.push answerObj

  prepareSubmissionAnswer: (question) ->
    if question.question_type is 'bodymap'
      @prepareAnswer(question, BodymapService.getSelections())
    else
      @prepareAnswer(question)

  # answer object pre-requisite
  prepareAnswer: (answerObj, regionSelections = null) ->
    switch answerObj.question_type
      when 'checklist', 'radio', 'checklist-grid', 'checklist-extra'
        @addSelectionAnswer(answerObj)
      when 'slider'
        @addSliderAnswer(answerObj)
      when 'textbox'
        @addTextboxAnswer(answerObj)
      when 'bodymap'
        @addBodymapAnswer(answerObj, regionSelections)
        BodymapService.reset()
      when 'boolean'
        # do nothing
      else
        console.log "invalid question type detected: #{answerObj.question_type}"

  # adds choice_ids for basic selection questions
  # TODO: remove underscore js and use coffee filter here
  addSelectionAnswer: (answerObj) ->
    selectedChoices = _.where(answerObj.choices, selected: true)
    if selectedChoices.length > 1
      @extractAnswers(answerObj, selectedChoices)
    else
      resultObj =
        question_id: answerObj.question_id
        choice_id:   selectedChoices[0].id
        value:       selectedChoices[0].value
      @addAnswer(resultObj)

  # extracts items from selectedChoices and pushes to answers array
  extractAnswers: (answerObj, selectedChoices) ->
    return unless selectedChoices.length
    item = selectedChoices.shift()
    resultObj =
      question_id: answerObj.question_id
      choice_id:   item.id
      value:       (if item.slider_disabled then "N/A" else item.value)
      custom_text: item.custom_text
    @addAnswer(resultObj)
    @extractAnswers(answerObj, selectedChoices)

  # adds integer 'value' to Answer for simple slider questions
  addSliderAnswer: (answerObj) ->
    resultObj =
      question_id: answerObj.question_id
      value:       parseInt(answerObj.choices[0].value)
    @addAnswer(resultObj)

  # adds custom textbox answer
  addTextboxAnswer: (answerObj) ->
    resultObj =
      question_id: answerObj.question_id
      custom_text: answerObj.choices[0].value
    @addAnswer(resultObj)

  # adds bodymap object answer
  addBodymapAnswer: (answerObj, regionSelections) ->
    resultObj =
      question_id:  answerObj.question_id
      bodymap_data: regionSelections
    @addAnswer(resultObj)

@SubmissionService.$inject = [ 'BodymapService' ]
