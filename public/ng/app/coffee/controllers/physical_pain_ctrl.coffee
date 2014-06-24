'use strict'

@PhysicalPainCtrl = @controllerModule.controller 'PhysicalPainCtrl', ($scope, PainService) ->
  $scope.recommendations = PainService.getItems('physical')
  console.log $scope.recommendations

@PhysicalPainCtrl.$inject = ['$scope', 'PainService']
