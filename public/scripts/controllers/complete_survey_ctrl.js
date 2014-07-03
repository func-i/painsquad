(function() {
  'use strict';
  this.CompleteSurveyCtrl = this.controllerModule.controller("CompleteSurveyCtrl", function($scope, $state, $rootScope, SubmissionService, UserService, surveyResult) {
    $scope.currentUser = UserService.currentUser();
    $scope.submission = SubmissionService.getSubmission();
    $scope.data = {
      xp_points: $scope.submission.xp_points,
      message: surveyResult.message
    };
    return $scope.home = function() {
      return $state.go('app.home');
    };
  });

  this.CompleteSurveyCtrl.$inject = ['$scope', '$state', '$rootScope', 'SubmissionService', 'UserService', 'surveyResult'];

}).call(this);
