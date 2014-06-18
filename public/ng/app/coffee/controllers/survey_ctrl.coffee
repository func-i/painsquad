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
    $scope.showNextButton      = true
    $scope.continueSurvey()

  $scope.noPain = ->
    $scope.submission.has_pain = false
    $scope.submit()

  # question handler, passes current choices to SubmissionService
  # calls continueSurvey which handles rendering of next partial
  $scope.nextQuestion = ->
    return unless $scope.showNext
    SurveyService.prepareSubmissionAnswer($scope.question)
    $scope.continueSurvey()


  $scope.continueSurvey = ->
    $scope.questionIndex++
    # if we are on the last question - prepare for textbox
    if $scope.questionIndex is ($scope.totalQuestions - 1)
      # $scope.showNext         = true
      $scope.showNextButton   = false
      $scope.showSubmitButton = true
      $scope.question         = survey.questions[$scope.questionIndex]
    else
      $scope.$broadcast 'resetQuestion'
      $scope.question = survey.questions[$scope.questionIndex]
    $ionicScrollDelegate.scrollTop()

  $scope.submit = ->
    SurveyService.prepareSubmissionAnswer($scope.question)
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
