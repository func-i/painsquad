(function() {
  'use strict';
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, AuthService, UserService, NotificationSettingsService, NotificationService) {
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.logout = function() {
      return AuthService.logout();
    };
    $scope.setNotifications = function() {
      if (window.plugin) {
        return NotificationSettingsService.setTestAlert();
      }
    };
    return $scope.clearAll = function() {
      if (window.plugin) {
        return NotificationService.cancelAll().then(function() {
          return console.log('cancelAll notifications');
        });
      }
    };
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'AuthService', 'UserService', 'NotificationSettingsService', 'NotificationService'];

}).call(this);
