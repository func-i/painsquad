'use strict'

# Parent controller responsible for handling survey navigation
# Survey question-specific logic delegated to sub-controllers
@SurveyCtrl = @controllerModule.controller "SurveyCtrl", ($scope, $state, $rootScope, $ionicScrollDelegate, survey, SubmissionResource, AuthService, SubmissionService, BodymapService) ->

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
    $scope.submit()

  # question handler, passes current choices to SubmissionService
  # calls continueSurvey which handles rendering of next partial
  $scope.nextQuestion = ->
    return unless $scope.showNext
    SubmissionService.prepareSubmissionAnswer($scope.question)
    $scope.continueSurvey()
    $scope.reloadScroll()

  $scope.continueSurvey = ->
    $scope.questionIndex++
    # if we are on the last question - prepare for textbox
    if $scope.questionIndex is ($scope.totalQuestions - 1)
      $scope.showNextButton   = false
      $scope.showSubmitButton = true
      $scope.question         = survey.questions[$scope.questionIndex]
    else
      $scope.$broadcast 'resetQuestion'
      $scope.question = survey.questions[$scope.questionIndex]

  $scope.reloadScroll = ->
    $timeout ->
      $ionicScrollDelegate.resize()
      $ionicScrollDelegate.scrollTop()

  $scope.submit = ->
    SubmissionService.prepareSubmissionAnswer($scope.question)
    SubmissionResource.save(submission: $scope.submission)
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
  $rootScope.sideMenuEnabled = false

@SurveyCtrl.$inject = ['$scope', '$state', '$rootScope', '$ionicScrollDelegate', 'survey', 'AuthService', 'SubmissionService', 'BodymapService']
