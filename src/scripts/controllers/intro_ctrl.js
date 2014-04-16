'use strict';

angular.module('painSquad.controllers')

.controller('IntroCtrl', function($scope, $state, $window, $ionicSlideBoxDelegate) {
  // Called to navigate to the main app
  $scope.startApp = function() {
    $state.go('home');
  };

  $scope.next = function() {
    $ionicSlideBoxDelegate.next();
  };

  $scope.previous = function() {
    $ionicSlideBoxDelegate.previous();
  };

  // Called each time the slide changes
  $scope.slideChanged = function(index) {
    $scope.slideIndex = index;
  };

  $scope.goBack = function() {
    $window.history.back();
  };
});
