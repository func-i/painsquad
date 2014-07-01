'use strict'

@CompleteSurveyCtrl = @controllerModule.controller "CompleteSurveyCtrl", ($scope, $state, $rootScope, SubmissionService, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.submission  = SubmissionService.getSubmission()

  $scope.data =
    message:            'Keffiyeh plaid meggings fashion axe typewriter Pinterest, letterpress stumptown synth pop-up church-key. Tousled quinoa iPhone, squid roof party trust fund retro pug umami mixtape.'
    xp_points:          $scope.submission.xp_points
    # message: "The case against pain is getting stronger every day! Keep up the good work and there may be a promotion in your future... maybe even a commendation or award!"

  $scope.home = ->
    $state.go 'app.home'

@CompleteSurveyCtrl.$inject = ['$scope', '$state', '$rootScope', 'SubmissionService', 'UserService']