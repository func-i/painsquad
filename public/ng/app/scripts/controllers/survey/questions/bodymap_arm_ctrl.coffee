'use strict'

@controllerModule.controller "ArmCtrl", ['$scope', '$state', ($scope, $state) ->
  $scope.activeTab = 'left'
  $scope.tempSelections =
    region: 'arms'
    first:  []
    second: []

  $scope.$on 'requestSelections', (event) ->
    $scope.$emit 'dualSelections', $scope.tempSelections

]