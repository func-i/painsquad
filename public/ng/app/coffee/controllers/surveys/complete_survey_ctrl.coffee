'use strict'

@CompleteSurveyCtrl = @controllerModule.controller "CompleteSurveyCtrl", ($scope, $state, $rootScope, SubmissionService, UserService, surveyResult) ->
  $scope.currentUser = UserService.currentUser()
  $scope.submission  = SubmissionService.getSubmission()

  $scope.data =
    xp_points: $scope.submission.xp_points
    message:   surveyResult.message

  $scope.home = ->
    $state.go 'app.home'

@CompleteSurveyCtrl.$inject = [ '$scope', '$state', '$rootScope', 'SubmissionService', 'UserService', 'surveyResult' ]
