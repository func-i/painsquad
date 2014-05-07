'use strict'

@controllerModule.controller "ChecklistExtraDetailCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->
  $scope.choice        = $stateParams.choice
  $scope.isOther = if $scope.choice is 'Other' then true else false

  $scope.currentValue  = 1
  $scope.sliderDisable = false

]
