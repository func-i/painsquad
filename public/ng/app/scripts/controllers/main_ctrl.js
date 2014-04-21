'use strict';

angular.module('painSquad.controllers')

.controller('MainCtrl', function($scope, $rootScope, $window, $location, $ionicSideMenuDelegate, $http) {

  $http.get('http://localhost:3000/api/v1/greet.json')
    .success(function(data) {
      $scope.message = data.message;
    })
    .error(function(data, status, headers, config) {
      $scope.message = status + ' ' + data + ' ' + headers + ' ' + config;
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
