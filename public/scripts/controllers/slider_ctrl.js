(function() {
  'use strict';
  this.SliderCtrl = this.controllerModule.controller("SliderCtrl", function($scope, $state) {
    return $scope.$on('resetQuestion', function(event) {
      return event.currentScope.currentForm.$setPristine();
    });
  });

  this.SliderCtrl.$inject = ['$scope', '$state'];

}).call(this);
