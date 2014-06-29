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
  'angularMoment'
]

@controllerModule = angular.module 'painSquad.controllers', []
@directiveModule  = angular.module 'painSquad.directives', []
@resourceModule   = angular.module 'painSquad.resources', []
@serviceModule    = angular.module 'painSquad.services', []
@filterModule     = angular.module 'painSquad.filters', []
@configModule     = angular.module 'painSquad.config', []

@painSquad.run ($ionicPlatform, $rootScope, $state, $stateParams) ->
  $rootScope.sideMenuEnabled = true

  $rootScope.$state       = $state
  $rootScope.$stateParams = $stateParams
  # helper to provide $state.back() method * won't work when page is reloaded
  $rootScope.$on "$stateChangeSuccess", (event, toState, toParams, fromState, fromParams) ->
    $rootScope.previousState_name   = fromState.name
    $rootScope.previousState_params = fromParams

  #back button function called from back button's ng-click="back()"
  $rootScope.back = ->
    $state.go $rootScope.previousState_name, $rootScope.previousState_params

  checkConnection = ->
    networkState = navigator.connection.type
    states = {}
    states[Connection.UNKNOWN] = "Unknown connection"
    states[Connection.ETHERNET] = "Ethernet connection"
    states[Connection.WIFI] = "WiFi connection"
    states[Connection.CELL_2G] = "Cell 2G connection"
    states[Connection.CELL_3G] = "Cell 3G connection"
    states[Connection.CELL_4G] = "Cell 4G connection"
    states[Connection.CELL] = "Cell generic connection"
    states[Connection.NONE] = "No network connection"
    alert "Connection type: " + states[networkState]

  $ionicPlatform.ready ->
    # checkConnection()

    if window.cordova and window.cordova.plugins.Keyboard
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar true

    if window.StatusBar
      StatusBar.styleLightContent()
