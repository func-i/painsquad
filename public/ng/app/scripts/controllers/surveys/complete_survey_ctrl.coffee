'use strict'

@controllerModule.controller "CompleteSurveyCtrl", ['$scope', 'SubmissionService', 'SubmissionResource', ($scope, SubmissionService, SubmissionResource) ->

  # TODO: Why do I have not access to any dependencies inside $scope.submitSurvey?
    # => if we invoke $scope.submitSurvey when the controller is instantiated, it can't access $scope?
    # => why does it seem like this controller is invoked twice?
    # => need to resolve DI injection before invoking submitSurvey?
  $scope.submitSurvey = () ->
    SubmissionResource.save(submission: $scope.submission)

  console.log("INSTANTIATED COMPLETE SURVEY CTRL")
  $scope.submission = SubmissionService.getSubmission()
]
