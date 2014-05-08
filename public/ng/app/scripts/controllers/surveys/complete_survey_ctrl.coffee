'use strict'

@CompleteSurveyCtrl = @controllerModule.controller "CompleteSurveyCtrl", ($scope, SubmissionService, SubmissionResource) ->

  $scope.submitSurvey = () ->
    SubmissionResource.save(submission: $scope.submission)

  $scope.submission = SubmissionService.getSubmission()

@CompleteSurveyCtrl.$inject = ['$scope', 'SubmissionService', 'SubmissionResource']