(function() {
  'use strict';
  this.CompleteSurveyCtrl = this.controllerModule.controller("CompleteSurveyCtrl", function($scope, $state, SubmissionService, UserService) {
    $scope.currentUser = UserService.currentUser();
    $scope.submission = SubmissionService.getSubmission();
    $scope.data = {
      message: 'Keffiyeh plaid meggings fashion axe typewriter Pinterest, letterpress stumptown synth pop-up church-key. Tousled quinoa iPhone, squid roof party trust fund retro pug umami mixtape.',
      xp_points: $scope.submission.xp_points
    };
    return $scope.home = function() {
      return $state.go('app.home');
    };
  });

  this.CompleteSurveyCtrl.$inject = ['$scope', '$state', 'SubmissionService', 'UserService'];

}).call(this);
