(function() {
  'use strict';
  this.PsychologicalPainCtrl = this.controllerModule.controller('PsychologicalPainCtrl', function($scope, PainService) {
    $scope.recommendations = PainService.getItems('psychological');
    return console.log($scope.recommendations);
  });

  this.PsychologicalPainCtrl.$inject = ['$scope', 'PainService'];

}).call(this);
