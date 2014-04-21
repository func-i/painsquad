'use strict';

angular.module('painSquad.controllers')

.controller('MainCtrl', function($rootScope, $scope, $window, $location, $ionicSideMenuDelegate, $http, storageService, apiService) {

  // $scope.message = apiService.getThings();

  apiService.getGreeting()
    .success(function(data) {
      $scope.message = data.message;
    })
    .error(function(data) {
      $scope.message = data;
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
