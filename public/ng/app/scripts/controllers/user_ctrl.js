'use strict';

angular.module('painSquad.controllers')

.controller('UserCtrl', function($window, $scope, $state, $stateParams) {
  $scope.goBack = function() {
    $window.history.back();
  };
});
