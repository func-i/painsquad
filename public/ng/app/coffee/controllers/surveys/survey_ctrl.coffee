'use strict'

@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ($scope, $state, $rootScope, $ionicScrollDelegate, $timeout, survey, SubmissionResource, AuthService, SubmissionService, BodymapService) ->

  $scope.startSurvey = ->
    $scope.submission     = SubmissionService.init(survey)
    $scope.questionIndex  = 0
    $scope.totalQuestions = survey.questions.length
    $scope.question       = survey.questions[$scope.questionIndex]

  $scope.hasPain = ->
    $scope.submission.has_pain = true
    $scope.showNextButton      = true
    $scope.continueSurvey()

  $scope.noPain = ->
    $scope.submission.has_pain = false
    $scope.submit(false)

  # question handler, passes current choices to SubmissionService
  # calls continueSurvey which handles rendering of next partial
  $scope.nextQuestion = ->
    return unless $scope.showNext
    SubmissionService.prepareSubmissionAnswer($scope.question)
    $scope.continueSurvey()

  $scope.continueSurvey = ->
    $timeout ->
      $scope.questionIndex++
      # if we are on the last question - prepare for textbox
      if $scope.questionIndex is ($scope.totalQuestions - 1)
        $scope.showNextButton   = false
        $scope.showSubmitButton = true
        $scope.question         = survey.questions[$scope.questionIndex]
      else
        $scope.$broadcast 'resetQuestion'
        $scope.question = survey.questions[$scope.questionIndex]
      $scope.reloadScroll()
    , 100

  $scope.reloadScroll = ->
    $timeout ->
      $ionicScrollDelegate.scrollTop()
      $ionicScrollDelegate.resize()
    , 50

  $scope.submit = (popup = true) ->
    SubmissionService.prepareSubmissionAnswer($scope.question)
    SubmissionResource.save(submission: $scope.submission)
    $state.go('app.survey_complete', popup: popup)

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

@SurveyCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicScrollDelegate', '$timeout', 'survey', 'AuthService', 'SubmissionService', 'BodymapService']
