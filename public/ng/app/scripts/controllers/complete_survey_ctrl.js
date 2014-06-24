(function() {
  'use strict';
  this.CompleteSurveyCtrl = this.controllerModule.controller("CompleteSurveyCtrl", function($scope, $state, $rootScope, SubmissionService, UserService) {
    var triggerPopupEvent;
    $scope.currentUser = UserService.currentUser();
    $scope.submission = SubmissionService.getSubmission();
    $scope.data = {
      message: 'Keffiyeh plaid meggings fashion axe typewriter Pinterest, letterpress stumptown synth pop-up church-key. Tousled quinoa iPhone, squid roof party trust fund retro pug umami mixtape.',
      xp_points: $scope.submission.xp_points
    };
    $scope.home = function() {
      $state.go('app.home');
      return triggerPopupEvent();
    };
    return triggerPopupEvent = function() {
      return $rootScope.$broadcast('surveyComplete');
    };
  });

  this.CompleteSurveyCtrl.$inject = ['$scope', '$state', '$rootScope', 'SubmissionService', 'UserService'];

}).call(this);
