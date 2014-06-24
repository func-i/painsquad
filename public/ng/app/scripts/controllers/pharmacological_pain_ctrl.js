(function() {
  'use strict';
  this.PharmacologicalPainCtrl = this.controllerModule.controller('PharmacologicalPainCtrl', function($scope, PainService) {
    $scope.recommendations = PainService.getItems('pharmacological');
    return console.log($scope.recommendations);
  });

  this.PharmacologicalPainCtrl.$inject = ['$scope', 'PainService'];

}).call(this);
