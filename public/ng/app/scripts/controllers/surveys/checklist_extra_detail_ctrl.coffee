'use strict'

@controllerModule.controller "ChecklistExtraDetailCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->
  $scope.choice        = $stateParams.choice
  $scope.currentValue  = 1
  $scope.sliderDisable = false

]
