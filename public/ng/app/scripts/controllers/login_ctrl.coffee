'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($state, $scope, AuthService, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.credentials = {}

  $scope.login = ->
    AuthService.login($scope.credentials)

  $scope.logout = ->
    UserService.remove()
    $state.go $state.current, {}, {reload: true}


@LoginCtrl.$inject = [ '$state', '$scope', 'AuthService', 'UserService' ]