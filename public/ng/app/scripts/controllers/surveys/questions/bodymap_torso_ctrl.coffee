'use strict'

@BodymapTorsoCtrl = @controllerModule.controller "BodymapTorsoCtrl", ($scope, $state) ->

  # $scope.switchSelections = $scope.
  # $scope.switchSelections =
  #   data: []

  $scope.$on 'requestSwitchSelections', (event) ->
    $scope.$emit 'dualSelections', $scope.$parent.modalSelection.tempSelections, 'torso'
    # $scope.$emit 'dualSelections', $scope.switchSelections.data, 'torso'

@BodymapTorsoCtrl.$inject = ['$scope', '$state']
