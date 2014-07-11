'use strict'

@painSquad = angular.module 'painSquad', [
  'ionic',
  'painSquad.controllers',
  'painSquad.directives',
  'painSquad.resources',
  'painSquad.services',
  'painSquad.filters',
  'painSquad.config',
  'ngResource',
  'underscore',
  'angularMoment',
  'googlechart'
]

@controllerModule = angular.module 'painSquad.controllers', []
@directiveModule  = angular.module 'painSquad.directives', []
@resourceModule   = angular.module 'painSquad.resources', []
@serviceModule    = angular.module 'painSquad.services', []
@filterModule     = angular.module 'painSquad.filters', []
@configModule     = angular.module 'painSquad.config', []

@painSquad.run ($ionicPlatform, $rootScope, $state, $stateParams, NetworkService, NotificationService) ->
  $rootScope.sideMenuEnabled = true
  $rootScope.notificationID  = 0
  $rootScope.$state          = $state
  $rootScope.$stateParams    = $stateParams

  # helper to provide $state.back() method * won't work when page is reloaded
  $rootScope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    $rootScope.previousState_name   = fromState.name
    $rootScope.previousState_params = fromParams

  #back button function called from back button's ng-click="back()"
  $rootScope.back = ->
    $state.go $rootScope.previousState_name, $rootScope.previousState_params

  checkConnection = ->
    NetworkService.isOnline()
      .then (isConnected) ->
        # $state.go 'app.home'
        console.log isConnected
      .catch (err) ->
        # $state.go 'app.login'
        console.log err

  $ionicPlatform.ready ->
    # if window.cordova and window.cordova.plugins.Keyboard
    #   cordova.plugins.Keyboard.shrinkView true
    #   cordova.plugins.Keyboard.hideKeyboardAccessoryBar true

    # if window.cordova and window.cordova.plugins
    #   window.cordova.plugins.notification.badge.clear()
    #   window.cordova.plugins.notification.badge.configure
    #     autoClear: true

    if window.StatusBar
      StatusBar.styleLightContent()

    if window.plugin
      # NotificationService.onclick = (id, state, json) ->
      #   parsedJson = JSON.parse(json)
      #   alert "id: #{id}, state: #{state}, json: #{parsedJson}"

      window.plugin.notification.local.onclick = (id, state, json) ->
        parsedJson = JSON.parse(json)
        alert "id: #{id}, state: #{state}, json: #{parsedJson}"
