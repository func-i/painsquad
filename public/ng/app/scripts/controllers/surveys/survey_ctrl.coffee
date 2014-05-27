'use strict'

# Parent controller responsible for handling survey navigation
# Survey question-specific logic delegated to sub-controllers
@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ($scope, $state, $stateParams, survey, AuthService, SurveyService, SubmissionService, BodymapService) ->

  $scope.startSurvey = ->
    $scope.submission     = SubmissionService.init(survey.id)
    $scope.questionIndex  = 0
    $scope.totalQuestions = survey.questions.length
    $scope.question       = survey.questions[$scope.questionIndex]

  # question handler, passes current choices to SubmissionService
  # calls continueSurvey which handles rendering of next partial
  $scope.nextQuestion = ->
    if $scope.submission.has_pain is "false"
      $scope.finishSurvey()
    else
      SurveyService.prepareSubmissionAnswer($scope.question)
      $scope.continueSurvey()

  $scope.continueSurvey = ->
    $scope.questionIndex++
    if $scope.questionIndex > survey.questions.length - 1
      $scope.finishSurvey()
    else
      $scope.question = survey.questions[$scope.questionIndex]

  $scope.getChoicesPartial = (question) ->
    "/templates/surveys/question_types/#{question.question_type}.html"

  $scope.finishSurvey = ->
    $state.go('app.survey_complete')

  $scope.$on 'currentForm:valid', (ev) ->
    $scope.showNext = true

  $scope.$on 'currentForm:invalid', (ev) ->
    $scope.showNext = false

  # PROGRESS BAR
  $scope.$watch 'questionIndex', ->
    surveyLength = survey.questions.length - 1
    $scope.surveyProgress = ($scope.questionIndex / surveyLength) * 100

  $scope.progressWidth = ->
    width: "#{$scope.surveyProgress}%"

  # DEFAULT ACTIONS
  $scope.startSurvey()
  $scope.showNext = false


@SurveyCtrl.$inject = ['$scope', '$state', '$stateParams', 'survey', 'AuthService', 'SurveyService', 'SubmissionService', 'BodymapService']

# resolve this resource before loading the controller
@SurveyCtrl.resolve =
  survey: (Survey, $q) ->
    deferred = $q.defer()

    Survey.query (response) ->
      deferred.resolve response.survey

    deferred.promise
