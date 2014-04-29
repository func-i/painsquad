'use strict'

@controllerModule.controller "CompleteSurveyCtrl", ['$scope', 'SubmissionService', 'SubmissionResource',
  ($scope, SubmissionService, SubmissionResource) ->

    $scope.submitSurvey = () ->
      SubmissionResource.save(submission: $scope.submission)

    $scope.submission = SubmissionService.getSubmission()
]
