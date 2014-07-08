(function() {
  'use strict';
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, AuthService, UserService) {
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    return $scope.logout = function() {
      return AuthService.logout();
    };
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'AuthService', 'UserService'];

}).call(this);
