'use strict'

@SettingsCtrl = @controllerModule.controller 'SettingsCtrl', ($rootScope, $scope, AuthService, UserService, NotificationSettingsService, NotificationService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()

  $scope.logout = ->
    AuthService.logout()

  $scope.setNotifications = ->
    if window.plugin
      NotificationSettingsService.setTestAlert()

  $scope.clearAll = ->
    if window.plugin
      NotificationService.cancelAll().then ->
        console.log 'cancelAll notifications'

@SettingsCtrl.$inject = [ '$rootScope', '$scope', 'AuthService', 'UserService', 'NotificationSettingsService', 'NotificationService' ]
