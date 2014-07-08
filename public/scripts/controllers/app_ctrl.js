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
    return $scope.$on("$destroy", function() {
      return $scope.loginModal.remove();
    });
  });

  this.AppCtrl.$inject = ['$scope', '$state', '$ionicModal'];

}).call(this);
