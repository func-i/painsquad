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

@painSquad.run ($ionicPlatform, $rootScope, $state, $stateParams, NetworkService) ->
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
    if window.plugin
      window.plugin.notification.local.onclick = (id, state, json) ->
        alert "ONCLICK id: #{id}, state: #{state}, json: #{json}"
        console.log "ONCLICK id: #{id}, state: #{state}, json: #{json}"

      window.plugin.notification.local.ontrigger = (id, state, json) ->
        alert "ONTRIGGER id: #{id}, state: #{state}, json: #{json}"
        console.log "ONTRIGGER id: #{id}, state: #{state}, json: #{json}"


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
      # NotificationSettingsService.setDefaults()
      # NotificationSettingsService.setTestAlert()

      window.plugin.notification.local.onclick = (id, state, json) ->
        alert "id: #{id}, state: #{state}, json: #{json}"

      window.plugin.notification.local.ontrigger = (id, state, json) ->
        alert "id: #{id}, state: #{state}, json: #{json}"

      # parsedJson = JSON.parse(json)
      # alert("Debugging onclick event, id: #{id}, state: #{state}, json: #{parsedJson}")

        # NotificationSettingsService.handleClick(id, state, json)
