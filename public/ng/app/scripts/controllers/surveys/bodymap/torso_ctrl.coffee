'use strict'

@controllerModule.controller "TorsoCtrl", ['$scope', '$state', ($scope, $state) ->
  $scope.activeTab = 'front'
  $scope.tempSelections =
    first:  []
    second: []

]