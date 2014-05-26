'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($state, $scope, AuthService, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.credentials = {}

  $scope.login = ->
    AuthService.login($scope.credentials)

  $scope.logout = ->
    $state.reload()
    # UserService.remove()
    # $state.reload()

@LoginCtrl.$inject = [ '$state', '$scope', 'AuthService', 'UserService' ]