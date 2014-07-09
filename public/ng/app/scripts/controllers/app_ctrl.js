(function() {
  'use strict';
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $state, $ionicModal) {
    $ionicModal.fromTemplateUrl("templates/shared/login.html", function(modal) {
      return $scope.loginModal = modal;
    }, {
      scope: $scope,
      animation: "slide-in-up",
      focusFirstInput: true
    });
    $ionicModal.fromTemplateUrl("templates/shared/levelup.html", function(modal) {
      return $scope.levelupModal = modal;
    }, {
      scope: $scope,
      animation: "slide-in-up",
      focusFirstInput: true
    });
    $scope.loadModal = function() {
      return $scope.levelupModal.show();
    };
    $scope.closeModal = function() {
      return $scope.levelupModal.hide();
    };
    return $scope.$on("$destroy", function() {
      $scope.loginModal.remove();
      return $scope.levelupModal.remove();
    });
  });

  this.AppCtrl.$inject = ['$scope', '$state', '$ionicModal'];

}).call(this);
