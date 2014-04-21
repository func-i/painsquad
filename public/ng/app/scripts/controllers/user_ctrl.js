'use strict';

angular.module('painSquad.controllers')

.controller('UserCtrl', function($scope, $window) {
  $scope.goBack = function() {
    $window.history.back();
  };
});
