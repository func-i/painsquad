(function() {
  'use strict';
<<<<<<< HEAD
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $state, $ionicModal, NotificationService, NotificationSettingsService) {
=======
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $rootScope, $state, $ionicModal) {
    $scope.levelUp = {};
>>>>>>> 03f187be7d5108f7bf0e8ae8918aa1a433212085
    $ionicModal.fromTemplateUrl("templates/shared/login.html", function(modal) {
      return $scope.loginModal = modal;
    }, {
      scope: $scope,
      animation: "slide-in-up",
      focusFirstInput: true
    });
<<<<<<< HEAD
    $scope.$on("$destroy", function() {
      return $scope.loginModal.remove();
=======
    $ionicModal.fromTemplateUrl("templates/shared/levelup.html", function(modal) {
      return $scope.levelupModal = modal;
    }, {
      scope: $scope,
      animation: "slide-in-up",
      focusFirstInput: true
    });
    $scope.closeModal = function() {
      return $scope.levelupModal.hide();
    };
    $rootScope.$on('event:levelup', function(event, args) {
      $scope.levelUp.image = args.image;
      $scope.levelUp.prev_rank = args.prev_rank;
      $scope.levelUp.rank = args.rank;
      return $scope.levelupModal.show();
    });
    return $scope.$on("$destroy", function() {
      $scope.loginModal.remove();
      return $scope.levelupModal.remove();
>>>>>>> 03f187be7d5108f7bf0e8ae8918aa1a433212085
    });
    return NotificationService.onclick = function() {
      if (window.cordova) {
        return NotificationSettingsService.handleClick(id, state, json);
      }
    };
  });

  this.AppCtrl.$inject = ['$scope', '$rootScope', '$state', '$ionicModal'];

}).call(this);
