'use strict'

@CompleteSurveyCtrl = @controllerModule.controller "CompleteSurveyCtrl",
  ['$scope', '$state', '$stateParams', 'SubmissionService',
  ($scope, $state, $stateParams, SubmissionService) ->
    # fetch existing submission
    $scope.submission = SubmissionService.getSubmission()
]
