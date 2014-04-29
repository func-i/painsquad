'use strict'

@controllerModule.controller 'HomeCtrl', ['$scope', '$state', '$stateParams', 'AuthService', 'SubmissionService',
  ($scope, $state, $stateParams, AuthService, SubmissionService) ->

    # TODO: This should probably be set somewhere globally
    $scope.currentUser = AuthService.getCurrentUser()

]