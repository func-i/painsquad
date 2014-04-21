'use strict';

angular.module('painSquad.controllers')

.controller('AboutCtrl', function($scope, $state) {

  $scope.toIntro = function() {
    $state.go('intro');
  };

});
