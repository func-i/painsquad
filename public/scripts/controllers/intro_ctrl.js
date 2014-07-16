(function() {
  'use strict';
  this.IntroCtrl = this.controllerModule.controller('IntroCtrl', function($scope, $state, $ionicSlideBoxDelegate) {
    console.log("Intro Controller");
    $scope.next = function() {
      return $ionicSlideBoxDelegate.next();
    };
    $scope.previous = function() {
      return $ionicSlideBoxDelegate.previous();
    };
    return $scope.slideChange = function(slideIndex) {
      return console.log("Changing slides to index: ", slideIndex);
    };
  });

  this.IntroCtrl.$inject = ['$scope', '$state', '$ionicSlideBoxDelegate'];

}).call(this);
