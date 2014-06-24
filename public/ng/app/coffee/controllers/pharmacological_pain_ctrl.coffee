'use strict'

@PharmacologicalPainCtrl = @controllerModule.controller 'PharmacologicalPainCtrl', ($scope, PainService) ->
  $scope.recommendations = PainService.getItems('pharmacological')
  console.log $scope.recommendations

@PharmacologicalPainCtrl.$inject = ['$scope', 'PainService']
