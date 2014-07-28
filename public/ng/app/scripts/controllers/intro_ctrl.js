(function() {
  'use strict';
  this.IntroCtrl = this.controllerModule.controller('IntroCtrl', function($scope, $rootScope, $state, $ionicSlideBoxDelegate, UserService) {
    var init;
    $rootScope.sideMenuEnabled = false;
    $scope.data = {
      hideNavBar: true,
      showLogin: true
    };
    $scope.next = function() {
      return $ionicSlideBoxDelegate.next();
    };
    $scope.previous = function() {
      return $ionicSlideBoxDelegate.previous();
    };
    $scope.login = function() {
      return $state.go('app.login');
    };
    $scope.goHome = function() {
      return $state.go('app.home');
    };
    init = function() {
      if (UserService.isLoggedIn()) {
        $scope.data.hideNavBar = false;
        return $scope.data.showLogin = false;
      }
    };
    return init();
  });

  this.IntroCtrl.$inject = ['$scope', '$rootScope', '$state', '$ionicSlideBoxDelegate'];

}).call(this);
