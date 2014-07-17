(function() {
  'use strict';
  this.painSquad = angular.module('painSquad', ['ionic', 'painSquad.controllers', 'painSquad.directives', 'painSquad.resources', 'painSquad.services', 'painSquad.filters', 'painSquad.config', 'ngResource', 'underscore', 'angularMoment', 'googlechart', 'angular-progress-arc', 'mediaPlayer']);

  this.controllerModule = angular.module('painSquad.controllers', []);

  this.directiveModule = angular.module('painSquad.directives', []);

  this.resourceModule = angular.module('painSquad.resources', []);

  this.serviceModule = angular.module('painSquad.services', []);

  this.filterModule = angular.module('painSquad.filters', []);

  this.configModule = angular.module('painSquad.config', []);

  this.painSquad.run(function($ionicPlatform, $rootScope, $state, $stateParams, NetworkService, NotificationService) {
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
      if (window.StatusBar) {
        StatusBar.styleLightContent();
      }
      if (window.plugin) {
        return window.plugin.notification.local.onclick = function(id, state, json) {
          var parsedJson;
          parsedJson = JSON.parse(json);
          return alert("id: " + id + ", state: " + state + ", json: " + parsedJson);
        };
      }
    });
  });

}).call(this);
