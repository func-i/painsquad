(function() {
  'use strict';
  this.IntroCtrl = this.controllerModule.controller('IntroCtrl', function($scope, $rootScope, $state, $ionicSlideBoxDelegate) {
    $scope.next = function() {
      return $ionicSlideBoxDelegate.next();
    };
    return $scope.previous = function() {
      return $ionicSlideBoxDelegate.previous();
    };
  });

  this.IntroCtrl.$inject = ['$scope', '$rootScope', '$state', '$ionicSlideBoxDelegate'];

}).call(this);
