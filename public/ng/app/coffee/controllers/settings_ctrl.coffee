# 'use strict'

@SettingsCtrl = @controllerModule.controller 'SettingsCtrl', ($rootScope, $scope, settings, moment, UserService, SettingResource) ->
  $scope.currentUser          = UserService.currentUser()
  $scope.isLoggedIn           = UserService.isLoggedIn()
  $scope.morningAlerts        = settings.morning_alerts
  $scope.eveningAlerts        = settings.evening_alerts
  $scope.selectedMorningAlert = {}
  $scope.selectedEveningAlert = {}

  $scope.handleSelection = (alert, alertArray) ->
    for date, index in alertArray
      # set selected false for old selection
      if date.selected
        date.selected = !date.selected
      # set selected true for new selection and bind it to model
      if alert is date
        date.selected = !date.selected
        alert = alertArray[index]
    saveSelection(alert)

  saveSelection = (alert) ->
    SettingResource.update(alert)

  init = ->
    for date, index in $scope.morningAlerts
      if date.selected
        $scope.selectedMorningAlert = $scope.morningAlerts[index]
    for date, index in $scope.eveningAlerts
      if date.selected
        $scope.selectedEveningAlert = $scope.eveningAlerts[index]  

  init()

@SettingsCtrl.$inject = [ '$rootScope', '$scope', 'settings', 'moment', 'UserService' ]
