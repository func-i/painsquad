(function() {
  'use strict';
  this.painSquad = angular.module('painSquad', ['ionic', 'painSquad.controllers', 'painSquad.directives', 'painSquad.resources', 'painSquad.services', 'painSquad.filters', 'painSquad.config', 'ngResource', 'underscore', 'angularMoment', 'googlechart']);

  this.controllerModule = angular.module('painSquad.controllers', []);

  this.directiveModule = angular.module('painSquad.directives', []);

  this.resourceModule = angular.module('painSquad.resources', []);

  this.serviceModule = angular.module('painSquad.services', []);

  this.filterModule = angular.module('painSquad.filters', []);

  this.configModule = angular.module('painSquad.config', []);

  this.painSquad.run(function($ionicPlatform, $rootScope, $state, $stateParams, NetworkService, NotificationSettingsService) {
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
      return NetworkService.isOnline().then(function(isConnected) {
        return console.log(isConnected);
      })["catch"](function(err) {
        return console.log(err);
      });
    };
    return $ionicPlatform.ready(function() {
      if (window.cordova && window.cordova.plugins) {
        window.cordova.plugins.notification.badge.clear();
        window.cordova.plugins.notification.badge.configure({
          autoClear: true
        });
      }
      if (window.StatusBar) {
        StatusBar.styleLightContent();
      }
      if (window.plugin) {
        NotificationService.cancelAll().then(function() {
          return NotificationSettingsService.setDefaultNotifications();
        });
        return window.plugin.notification.local.onclick = function(id, state, json) {
          return NotificationSettingsService.handleClick(id, state, json);
        };
      }
    });
  });

}).call(this);
