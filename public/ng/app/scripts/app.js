(function() {
  'use strict';
  this.painSquad = angular.module('painSquad', ['ionic', 'painSquad.controllers', 'painSquad.directives', 'painSquad.resources', 'painSquad.services', 'painSquad.filters', 'painSquad.config', 'ngResource', 'underscore', 'angularMoment']);

  this.controllerModule = angular.module('painSquad.controllers', []);

  this.directiveModule = angular.module('painSquad.directives', []);

  this.resourceModule = angular.module('painSquad.resources', []);

  this.serviceModule = angular.module('painSquad.services', []);

  this.filterModule = angular.module('painSquad.filters', []);

  this.configModule = angular.module('painSquad.config', []);

  this.painSquad.run(function($ionicPlatform, $rootScope, $state, $stateParams) {
    var checkConnection;
    $rootScope.sideMenuEnabled = true;
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
      var networkState, states;
      networkState = navigator.connection.type;
      states = {};
      states[Connection.UNKNOWN] = "Unknown connection";
      states[Connection.ETHERNET] = "Ethernet connection";
      states[Connection.WIFI] = "WiFi connection";
      states[Connection.CELL_2G] = "Cell 2G connection";
      states[Connection.CELL_3G] = "Cell 3G connection";
      states[Connection.CELL_4G] = "Cell 4G connection";
      states[Connection.CELL] = "Cell generic connection";
      states[Connection.NONE] = "No network connection";
      return alert("Connection type: " + states[networkState]);
    };
    return $ionicPlatform.ready(function() {
      if (window.cordova && window.cordova.plugins.Keyboard) {
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      }
      if (window.StatusBar) {
        return StatusBar.styleLightContent();
      }
    });
  });

}).call(this);
