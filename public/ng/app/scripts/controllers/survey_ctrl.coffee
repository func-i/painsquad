'use strict'

# Parent controller responsible for handling survey navigation
# Survey question-specific logic delegated to sub-controllers
@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ['$scope', '$state', '$stateParams', 'AuthService', 'SubmissionService', 'survey',
  ($scope, $state, $stateParams, AuthService, SubmissionService, survey) ->

    $scope.startSurvey = () ->
      $scope.submission    = SubmissionService.init(survey.id)
      $scope.questionIndex = 0
      $scope.question      = survey.questions[$scope.questionIndex]

    $scope.nextQuestion = () ->
      SubmissionService.addAnswer($scope.question)
      $scope.questionIndex++

      if $scope.questionIndex > survey.questions.length - 1
        $scope.finishSurvey()
      else
        $scope.question = survey.questions[$scope.questionIndex]

    $scope.getChoicesPartial = (question) ->
      "/templates/surveys/question_types/#{question.choice_type}.html"

    $scope.finishSurvey = () ->
      $state.go('app.survey_complete')

    # needs its own controller
    $scope.setRadioAnswer = (question, choice) ->
      for c in question.choices
        delete c.selected
      choice.selected = true

    # needs its own controller
    $scope.painCheck = (hasPain) ->
      $scope.submission.has_pain = hasPain
      if hasPain then $scope.nextQuestion() else $scope.finishSurvey()

    # DEFAULT ACTIONS
    $scope.startSurvey()

]

# resolve this resource before loading the controller
@SurveyCtrl.resolve =
  survey: (Survey, $q) ->
    deferred = $q.defer()

    Survey.query (response) ->
      deferred.resolve response.survey

    deferred.promise
