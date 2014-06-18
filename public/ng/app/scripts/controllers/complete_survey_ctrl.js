(function() {
  'use strict';
  this.CompleteSurveyCtrl = this.controllerModule.controller("CompleteSurveyCtrl", function($scope, $state, SubmissionService, SubmissionResource, UserService) {
    $scope.currentUser = UserService.currentUser();
    $scope.submission = SubmissionService.getSubmission();
    $scope.data = {
      submission_message: "The case against pain is getting stronger every day! Keep up the good work and there may be a promotion in your future... maybe even a commendation or award!",
      xp_points: 10
    };
    return $scope.home = function() {
      return $state.go('app.home');
    };
  });

  this.CompleteSurveyCtrl.$inject = ['$scope', '$state', 'SubmissionService', 'SubmissionResource', 'UserService'];

}).call(this);
