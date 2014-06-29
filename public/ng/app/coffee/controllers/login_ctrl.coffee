'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($state, $scope, AuthService, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()
  $scope.credentials = {}

  $scope.login = ->
    AuthService.login($scope.credentials)

  $scope.logout = ->
    UserService.remove()
    UserService.clearToken()
    $state.go $state.current, {}, {reload: true}

  # $rootScope.checkConnection()

@LoginCtrl.$inject = [ '$state', '$scope', 'AuthService', 'UserService' ]