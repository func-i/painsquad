(function() {
  'use strict';
  this.CompleteSurveyCtrl = this.controllerModule.controller("CompleteSurveyCtrl", function($scope, SubmissionService, SubmissionResource) {
    $scope.submitSurvey = function() {
      return SubmissionResource.save({
        submission: $scope.submission
      });
    };
    return $scope.submission = SubmissionService.getSubmission();
  });

  this.CompleteSurveyCtrl.$inject = ['$scope', 'SubmissionService', 'SubmissionResource'];

}).call(this);
