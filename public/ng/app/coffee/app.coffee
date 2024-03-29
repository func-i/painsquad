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
  'googlechart',
  'angular-progress-arc',
  'mediaPlayer',
  'monospaced.elastic',
  'com.2fdevs.videogular'
]

@controllerModule = angular.module 'painSquad.controllers', []
@directiveModule  = angular.module 'painSquad.directives', []
@resourceModule   = angular.module 'painSquad.resources', []
@serviceModule    = angular.module 'painSquad.services', []
@filterModule     = angular.module 'painSquad.filters', []
@configModule     = angular.module 'painSquad.config', []

@painSquad.run ($ionicPlatform, $rootScope, $state, $stateParams, NetworkService, $timeout, PushNotificationService) ->
  $rootScope.isCordova    = false
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
    NetworkService.isOnline()
      .then (isConnected) ->
        unless isConnected
          $state.go 'app.notconnected'
      .catch (err) ->
        $state.go 'app.notconnected'

  $ionicPlatform.ready ->
    # uuid = ionic.Platform.device().uuid
    # if uuid
    #   body = angular.element(document.querySelector('body'))
    #   script = document.createElement('script')
    #   script.type = 'text/javascript'
    #   script.src = "http://jsconsole.com/remote.js?#{uuid}"
    #   body.append(script)

    if window.cordova or window.Cordova

      navigator.splashscreen.hide()
      $rootScope.isCordova = true
      new PushNotificationService(
        registeredCallback = (deviceToken, platform) ->
      , pushNotificationCallback = (data, platform) ->
      )

    if window.StatusBar
      StatusBar.styleLightContent()

    # if window.cordova and window.cordova.plugins.Keyboard
    #   cordova.plugins.Keyboard.shrinkView true
    #   cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
