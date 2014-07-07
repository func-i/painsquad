(function() {
  'use strict';
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $state, $ionicModal, NotificationService, NotificationSettingsService) {
    $ionicModal.fromTemplateUrl("templates/shared/login.html", function(modal) {
      return $scope.loginModal = modal;
    }, {
      scope: $scope,
      animation: "slide-in-up",
      focusFirstInput: true
    });
    $scope.$on("$destroy", function() {
      return $scope.loginModal.remove();
    });
    return NotificationService.onclick = function() {
      if (window.cordova) {
        return NotificationSettingsService.handleClick(id, state, json);
      }
    };
  });

  this.AppCtrl.$inject = ['$scope', '$state', '$ionicModal'];

}).call(this);
