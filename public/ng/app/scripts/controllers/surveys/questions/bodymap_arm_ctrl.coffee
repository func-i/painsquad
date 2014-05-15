'use strict'

@BodymapArmCtrl = @controllerModule.controller "BodymapArmCtrl", ($scope, $state) ->

  $scope.switchSelections =
    data: []

  $scope.$on 'requestSwitchSelections', (event) ->
    $scope.$emit 'dualSelections', $scope.switchSelections.data, 'arms'

@BodymapArmCtrl.$inject = ['$scope', '$state']