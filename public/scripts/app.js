(function() {
  'use strict';
  this.painSquad = angular.module('painSquad', ['ionic', 'painSquad.controllers', 'painSquad.directives', 'painSquad.resources', 'painSquad.services', 'painSquad.filters', 'painSquad.config', 'ngResource', 'underscore', 'angularMoment', 'googlechart', 'angular-progress-arc', 'mediaPlayer', 'monospaced.elastic', 'com.2fdevs.videogular']);

  this.controllerModule = angular.module('painSquad.controllers', []);

  this.directiveModule = angular.module('painSquad.directives', []);

  this.resourceModule = angular.module('painSquad.resources', []);

  this.serviceModule = angular.module('painSquad.services', []);

  this.filterModule = angular.module('painSquad.filters', []);

  this.configModule = angular.module('painSquad.config', []);

  this.painSquad.run(function($ionicPlatform, $rootScope, $state, $stateParams, NetworkService, $timeout, PushNotificationService) {
    var checkConnection;
    $rootScope.isCordova = false;
    $rootScope.$state = $state;
    $rootScope.$stateParams = $stateParams;
    $rootScope.$on("$stateChangeSuccess", function(event, toState, toParams, fromState, fromParams) {
      $rootScope.previousState_name = fromState.name;
      return $rootScope.previousState_params = fromParams;
    });
    $rootScope.back = function() {
      return $state.go($rootScope.previousState_name, $rootScope.previousState_params);
    };
    checkConnection = function() {
      return NetworkService.isOnline().then(function(isConnected) {
        if (!isConnected) {
          return $state.go('app.notconnected');
        }
      })["catch"](function(err) {
        return $state.go('app.notconnected');
      });
    };
    return $ionicPlatform.ready(function() {
      var pushNotificationCallback, registeredCallback;
      if (window.cordova || window.Cordova) {
        $rootScope.jsConsoleSrc = "http://jsconsole.com/remote.js?" + (ionic.Platform.device().uuid);
        navigator.splashscreen.hide();
        $rootScope.isCordova = true;
        console.log("Starting push notification service");
        new PushNotificationService(registeredCallback = function(deviceToken, platform) {}, pushNotificationCallback = function(data, platform) {});
      }
      if (window.StatusBar) {
        return StatusBar.styleLightContent();
      }
    });
  });

}).call(this);
