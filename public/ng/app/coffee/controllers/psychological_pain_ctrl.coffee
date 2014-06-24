'use strict'

@PsychologicalPainCtrl = @controllerModule.controller 'PsychologicalPainCtrl', ($scope, PainService) ->
  $scope.recommendations = PainService.getItems('psychological')
  console.log $scope.recommendations

@PsychologicalPainCtrl.$inject = ['$scope', 'PainService']
