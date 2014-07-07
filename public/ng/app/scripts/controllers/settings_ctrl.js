(function() {
  'use strict';
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, AuthService, UserService, NotificationSettingsService, NotificationService) {
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.logout = function() {
      return AuthService.logout();
    };
    return $scope.debugNotifications = function() {
      if (window.plugin) {
        return NotificationService.getScheduledIds($scope).then(function(data) {
          return console.log(data);
        });
      } else {
        return console.log('cannot debug in browser');
      }
    };
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'AuthService', 'UserService', 'NotificationSettingsService', 'NotificationService'];

}).call(this);
