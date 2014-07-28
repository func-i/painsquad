(function() {
  'use strict';
  this.LoginCtrl = this.controllerModule.controller('LoginCtrl', function($rootScope, $state, $scope, AuthService, UserService) {
    $rootScope.sideMenuEnabled = false;
    $scope.message = "";
    $scope.user = {
      email: null,
      password: null
    };
    $scope.login = function() {
      return AuthService.login($scope.user);
    };
    $scope.$on("event:auth-loginRequired", function(e, rejection) {
      return $scope.loginModal.show();
    });
    $scope.$on("event:auth-loginConfirmed", function() {
      $scope.email = null;
      $scope.password = null;
      return $scope.loginModal.hide();
    });
    $scope.$on("event:auth-login-failed", function(e, status) {
      var error;
      if (status.status === 401) {
        error = "Invalid Username or Password.";
      } else {
        error = "Login failed.";
      }
      return $scope.message = error;
    });
    return $scope.$on("event:auth-logout-complete", function() {
      return $state.go("app.login", {}, {
        reload: true,
        inherit: false
      });
    });
  });

  this.LoginCtrl.$inject = ['$rootScope', '$state', '$scope', 'AuthService', 'UserService'];

}).call(this);
