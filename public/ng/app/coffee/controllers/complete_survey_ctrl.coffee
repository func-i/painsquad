'use strict'

@CompleteSurveyCtrl = @controllerModule.controller "CompleteSurveyCtrl", ($scope, $state, SubmissionService, SubmissionResource, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.submission  = SubmissionService.getSubmission()

  $scope.data =
    submission_message: "The case against pain is getting stronger every day! Keep up the good work and there may be a promotion in your future... maybe even a commendation or award!"
    xp_points:          $scope.submission.xp_points

  $scope.home = ->
    $state.go 'app.home'


@CompleteSurveyCtrl.$inject = ['$scope', '$state', 'SubmissionService', 'SubmissionResource', 'UserService']