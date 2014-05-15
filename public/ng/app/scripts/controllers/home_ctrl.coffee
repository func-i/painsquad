'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, $stateParams, AuthService, SubmissionService) ->

    # TODO: This should probably be set somewhere globally
    $scope.currentUser = AuthService.getCurrentUser()

@HomeCtrl.$inject = ['$scope', '$state', '$stateParams', 'AuthService', 'SubmissionService']