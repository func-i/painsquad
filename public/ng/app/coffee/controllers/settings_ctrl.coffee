'use strict'

@SettingsCtrl = @controllerModule.controller 'SettingsCtrl', ($rootScope, $scope, AuthService, UserService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()

  $scope.logout = ->
    AuthService.logout()

@SettingsCtrl.$inject = [ '$rootScope', '$scope', 'AuthService', 'UserService' ]