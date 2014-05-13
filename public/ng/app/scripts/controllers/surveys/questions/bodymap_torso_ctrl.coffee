'use strict'

@controllerModule.controller "TorsoCtrl", ['$scope', '$state', ($scope, $state) ->
  $scope.activeTab = 'front'
  $scope.tempSelections =
    region: 'torso'
    first:  []
    second: []

  $scope.$on 'requestSelections', (event) ->
    $scope.$emit 'dualSelections', $scope.tempSelections

]