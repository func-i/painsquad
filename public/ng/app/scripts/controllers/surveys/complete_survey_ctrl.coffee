'use strict'

@controllerModule.controller "CompleteSurveyCtrl", ['$scope', 'SubmissionService', 'SubmissionResource', ($scope, SubmissionService, SubmissionResource) ->
  $scope.submission = SubmissionService.getSubmission()

  # TODO: Why do I have not access to any dependencies inside $scope.submitSurvey?
    # => if we invoke $scope.submitSurvey when the controller is instantiated, it can't access $scope?
    # => why does it seem like this controller is invoked twice?
    # => need to resolve DI injection before invoking submitSurvey? :W
  $scope.submitSurvey = () ->
    SubmissionResource.save(submission: $scope.submission)

]
