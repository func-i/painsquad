'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $rootScope, $state, $stateParams, AuthService, SubmissionService, UserService) ->
  $scope.currentUser = UserService.currentUser()

@HomeCtrl.$inject = ['$scope', '$rootScope', '$state', '$stateParams', 'AuthService', 'SubmissionService', 'UserService']

# redirects to login view if currentUser is not set inside UserService
@HomeCtrl.resolve =
  resolveUser: (UserService, $state) ->
    unless UserService.isLoggedIn()
      $state.go 'app.login'
