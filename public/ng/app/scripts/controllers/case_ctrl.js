'use strict';

angular.module('painSquad.controllers')

.controller('CaseCtrl', function($scope, $stateParams) {
  $scope.cases = [
    { title: 'Pain', id: 1 },
    { title: 'Aches', id: 2 },
    { title: 'Cold', id: 3 },
    { title: 'Fever', id: 4 }
  ];

  $scope.pain = {};
});
