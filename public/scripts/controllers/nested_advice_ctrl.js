(function() {
  'use strict';
  this.NestedAdviceCtrl = this.controllerModule.controller('NestedAdviceCtrl', function($scope, $state, $stateParams, $ionicModal) {
    $ionicModal.fromTemplateUrl("templates/advice/modal.steps.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    return $scope.loadNestedModal = function(item) {
      $scope.nestedSelection = item;
      return $scope.modal.show();
    };
  });

  this.NestedAdviceCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal'];

}).call(this);
