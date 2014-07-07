'use strict'

@SettingsCtrl = @controllerModule.controller 'SettingsCtrl', ($rootScope, $scope, AuthService, UserService, NotificationSettingsService, NotificationService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()

  $scope.logout = ->
    AuthService.logout()

  $scope.debugNotifications = ->
    if window.plugin
      NotificationService.getScheduledIds($scope).then (data) ->
        console.log data
    else
      console.log 'cannot debug in browser'

  # setNotifications = ->
  #   if window.plugin
  #     NotificationSettingsService.setDefaultNotifications()

  # setNotifications()

@SettingsCtrl.$inject = [ '$rootScope', '$scope', 'AuthService', 'UserService', 'NotificationSettingsService', 'NotificationService' ]
