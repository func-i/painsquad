(function() {
  'use strict';
  this.CompleteSurveyCtrl = this.controllerModule.controller("CompleteSurveyCtrl", function($scope, $state, $stateParams, $rootScope, SubmissionService, UserService, surveyResult, currentUserResponse) {
    var currentUser;
    currentUser = currentUserResponse.user;
    UserService.set(currentUser);
    $scope.currentUser = currentUser;
    $scope.submission = SubmissionService.getSubmission();
    $scope.data = {
      xp_points: $scope.submission.xp_points,
      message: surveyResult.message
    };
    return $scope.home = function() {
      return $state.go('app.home', {
        popup: $stateParams.popup
      });
    };
  });

  this.CompleteSurveyCtrl.$inject = ['$scope', '$state', '$rootScope', 'SubmissionService', 'UserService', 'surveyResult'];

}).call(this);
