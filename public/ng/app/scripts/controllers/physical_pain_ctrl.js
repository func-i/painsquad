(function() {
  'use strict';
  this.PhysicalPainCtrl = this.controllerModule.controller('PhysicalPainCtrl', function($scope, PainService) {
    $scope.recommendations = PainService.getItems('physical');
    return console.log($scope.recommendations);
  });

  this.PhysicalPainCtrl.$inject = ['$scope', 'PainService'];

}).call(this);
