'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($state, $scope, AuthService, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.credentials = {}

  $scope.isLoggedIn = ->
    $scope.currentUser?

  $scope.login = ->
    AuthService.login($scope.credentials)

  $scope.logout = ->
    UserService.remove()
    UserService.clearToken()
    $state.go $state.current, {}, {reload: true}

  console.log "Login Ctrl Init, currentUser: ", $scope.currentUser
  $scope.isLoggedIn()

@LoginCtrl.$inject = [ '$state', '$scope', 'AuthService', 'UserService' ]