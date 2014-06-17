(function() {
  'use strict';
  this.TextboxCtrl = this.controllerModule.controller("TextboxCtrl", function($scope, $state, $stateParams) {
    $scope.showSubmitButton = true;
    return $scope.showNextButton = false;
  });

  this.TextboxCtrl.$inject = ['$scope', '$state', '$stateParams'];

}).call(this);
