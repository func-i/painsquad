(function() {
  'use strict';
  this.painSquad = angular.module('painSquad', ['ionic', 'painSquad.controllers', 'painSquad.directives', 'painSquad.resources', 'painSquad.services', 'painSquad.filters', 'painSquad.config', 'ngResource', 'underscore', 'angularMoment', 'googlechart']);

  this.controllerModule = angular.module('painSquad.controllers', []);

  this.directiveModule = angular.module('painSquad.directives', []);

  this.resourceModule = angular.module('painSquad.resources', []);

  this.serviceModule = angular.module('painSquad.services', []);

  this.filterModule = angular.module('painSquad.filters', []);

  this.configModule = angular.module('painSquad.config', []);

  this.painSquad.run(function($ionicPlatform, $rootScope, $state, $stateParams, NetworkService) {
    var checkConnection;
    $rootScope.sideMenuEnabled = true;
    $rootScope.notificationID = 0;
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
        return console.log(isConnected);
      })["catch"](function(err) {
        return console.log(err);
      });
    };
    return $ionicPlatform.ready(function() {
      if (window.plugin) {
        window.plugin.notification.local.onclick = function(id, state, json) {
          alert("ONCLICK id: " + id + ", state: " + state + ", json: " + json);
          return console.log("ONCLICK id: " + id + ", state: " + state + ", json: " + json);
        };
        window.plugin.notification.local.ontrigger = function(id, state, json) {
          alert("ONTRIGGER id: " + id + ", state: " + state + ", json: " + json);
          return console.log("ONTRIGGER id: " + id + ", state: " + state + ", json: " + json);
        };
      }
      if (window.StatusBar) {
        StatusBar.styleLightContent();
      }
      if (window.plugin) {
        window.plugin.notification.local.onclick = function(id, state, json) {
          return alert("id: " + id + ", state: " + state + ", json: " + json);
        };
        return window.plugin.notification.local.ontrigger = function(id, state, json) {
          return alert("id: " + id + ", state: " + state + ", json: " + json);
        };
      }
    });
  });

}).call(this);
