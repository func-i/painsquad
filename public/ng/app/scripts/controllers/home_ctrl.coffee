'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $state, UserService) ->
  $scope.currentUser = UserService.currentUser()

@HomeCtrl.$inject = ['$scope', '$state', 'UserService']

# redirects to login view if currentUser is not set inside UserService
@HomeCtrl.resolve =
  resolveUser: (UserService, $state) ->
    unless UserService.isLoggedIn()
      $state.go 'app.login'
