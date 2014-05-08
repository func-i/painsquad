'use strict'

@SurveyService = @serviceModule.service 'SurveyService', (_, SubmissionService, BodymapService) ->

  prepareSubmissionAnswer: (question) ->
    if question.question_type is 'bodymap'
      SubmissionService.prepareAnswer(question, BodymapService.getSelections())
    else
      SubmissionService.prepareAnswer(question)

@SurveyService.$inject = ['_', 'SubmissionService', 'BodymapService']
