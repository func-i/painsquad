'use strict';

angular.module('painSquad.controllers')

.controller('MenuCtrl', function($scope, $rootScope, $window, $location, $ionicSideMenuDelegate) {
  $scope.goToPage = function(page) {
    // console.log($rootScope.isTablet);
    if (!$rootScope.isTablet) {
      $ionicSideMenuDelegate.toggleLeft(false);
    }
    $location.url('/' + page);
  };

  $scope.closeSideMenu = function() {
    $ionicSideMenuDelegate.close();
  };

  $scope.goBack = function() {
    $window.history.back();
  };

  $scope.openLeftPanel = function() {
    $ionicSideMenuDelegate.toggleLeft();
  };
});
