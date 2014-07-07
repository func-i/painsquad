'use strict'

@SettingsCtrl = @controllerModule.controller 'SettingsCtrl', ($rootScope, $scope, AuthService, UserService, NotificationService) ->
  $scope.currentUser = UserService.currentUser()
  $scope.isLoggedIn  = UserService.isLoggedIn()

  $scope.logout = ->
    AuthService.logout()

  debugNotifications = ->
    console.log 'getDefaults', NotificationService.getDefaults()
    # NotificationService.getScheduledIds.then ->
      # console.log
    # console.log 'getScheduledIds', NotificationService.getScheduledIds($scope).then -> console.log

  setDefaultNotification = ->
    time = new Date()
    time.setSeconds time.getSeconds() + 30
    NotificationService.add
      id:      1
      title:   "PainSquad"
      message: "Time for a pain case!"
      repeat:  "minutely"
      date:    time
    , $scope

  # debugNotifications()
  setDefaultNotification()

@SettingsCtrl.$inject = [ '$rootScope', '$scope', 'AuthService', 'UserService' ]

# $scope.showLocal = ->
#   NotificationService.add
#     id:         '123'
#     date:       Date.now()
#     message:    'Test 123'
#     repeat:     'minutely'
#     autoCancel: true