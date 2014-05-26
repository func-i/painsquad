'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $rootScope, $state, $stateParams, AuthService, SubmissionService, UserService) ->
  $scope.currentUser = UserService.currentUser()

@HomeCtrl.$inject = ['$scope', '$rootScope', '$state', '$stateParams', 'AuthService', 'SubmissionService', 'UserService']