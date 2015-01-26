'use strict'

@CompleteSurveyCtrl = @controllerModule.controller "CompleteSurveyCtrl", ($scope, $state, $stateParams, $rootScope, SubmissionService, UserService, surveyResult, currentUserResponse) ->

  currentUser = currentUserResponse.user
  UserService.set(currentUser)
  $scope.currentUser = currentUser
  $scope.submission  = SubmissionService.getSubmission()

  $scope.data =
    xp_points: $scope.submission.xp_points
    message:   surveyResult.message

  $scope.home = ->
    $state.go('app.home', {popup: $stateParams.popup})

@CompleteSurveyCtrl.$inject = [ '$scope', '$state', '$rootScope', 'SubmissionService', 'UserService', 'surveyResult' ]
