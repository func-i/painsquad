'use strict';

angular.module('painSquad.controllers')

.controller('AboutCtrl', function($scope, $state, $stateParams) {

  $scope.toIntro = function() {
    $state.go('intro');
  }

});
