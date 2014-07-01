(function() {
  'use strict';
  this.LoginCtrl = this.controllerModule.controller('LoginCtrl', function($state, $scope, AuthService, UserService) {
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.credentials = {};
    $scope.login = function() {
      return AuthService.login($scope.credentials);
    };
    return $scope.logout = function() {
      UserService.remove();
      UserService.clearToken();
      return $state.go($state.current, {}, {
        reload: true
      });
    };
  });

  this.LoginCtrl.$inject = ['$state', '$scope', 'AuthService', 'UserService'];

}).call(this);
