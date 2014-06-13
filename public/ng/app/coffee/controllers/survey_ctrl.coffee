'use strict'

# Parent controller responsible for handling survey navigation
# Survey question-specific logic delegated to sub-controllers
@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ($scope, $state, $stateParams, $ionicScrollDelegate, survey, AuthService, SurveyService, SubmissionService, BodymapService) ->

  $scope.startSurvey = ->
    $scope.submission     = SubmissionService.init(survey.id)
    $scope.questionIndex  = 0
    $scope.totalQuestions = survey.questions.length
    $scope.question       = survey.questions[$scope.questionIndex]

  $scope.hasPain = ->
    $scope.submission.has_pain = true
    $scope.continueSurvey()

  $scope.noPain = ->
    $scope.submission.has_pain = false
    $scope.finishSurvey()

  # question handler, passes current choices to SubmissionService
  # calls continueSurvey which handles rendering of next partial
  $scope.nextQuestion = ->
    SurveyService.prepareSubmissionAnswer($scope.question)
    $scope.continueSurvey()

  $scope.continueSurvey = ->
    $scope.questionIndex++
    if $scope.questionIndex > $scope.totalQuestions - 1
      $scope.finishSurvey()
    else
      $scope.$broadcast 'resetQuestion'
      $scope.question = survey.questions[$scope.questionIndex]
      $ionicScrollDelegate.scrollTop()

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

@SurveyCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicScrollDelegate', 'survey', 'AuthService', 'SurveyService', 'SubmissionService', 'BodymapService']
