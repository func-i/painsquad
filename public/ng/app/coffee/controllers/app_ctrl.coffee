'use strict'

@AppCtrl = @controllerModule.controller 'AppCtrl', ($scope, $state, $ionicModal, NotificationService, NotificationSettingsService) ->

  $ionicModal.fromTemplateUrl "templates/shared/login.html", (modal) ->
    $scope.loginModal = modal
  ,
    scope: $scope
    animation: "slide-in-up"
    focusFirstInput: true

  $scope.$on "$destroy", ->
    $scope.loginModal.remove()

  NotificationService.onclick = ->
    if window.cordova
      NotificationSettingsService.handleClick(id, state, json)

@AppCtrl.$inject = [ '$scope', '$state', '$ionicModal' ]
