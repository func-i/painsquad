'use strict'

@controllerModule.controller "ArmCtrl", ['$scope', '$state', ($scope, $state) ->
  $scope.activeTab = 'left'
  $scope.tempSelections =
    first:  []
    second: []

]