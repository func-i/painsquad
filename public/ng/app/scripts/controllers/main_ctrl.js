'use strict';

angular.module('painSquad.controllers')

.controller('MainCtrl', function($rootScope, $scope, $window, $location, $ionicSideMenuDelegate, $http, storageService, apiService) {

  apiService.getThing(1)
    .success(function(data) {
      $scope.data = data;
    })
    .error(function(data) {
      $scope.data = data;
    });

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
