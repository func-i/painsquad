(function() {
  'use strict';
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $rootScope, $state, $ionicModal, $timeout, CONFIG, TokenResource, ModalService) {
    var saveDeviceToken;
    $scope.levelUp = {};
    $scope.advice = {};
    ModalService.registerModals($scope);
    $scope.closeModal = function() {
      return $scope.levelupModal.hide();
    };
    $scope.closeAdvice = function() {
      return $scope.adviceModal.hide();
    };
    $scope.playLevelupVideo = function() {
      var path;
      path = "" + CONFIG.baseUrl + "/videos/ranks/" + $scope.levelUp.image + ".m4v";
      return $scope.$broadcast('event:playVideo', path);
    };
    saveDeviceToken = function() {
      if ($rootScope.deviceToken) {
        return TokenResource.update({
          device_token: $rootScope.deviceToken
        });
      }
    };
    $rootScope.$on('event:levelup', function(event, args) {
      $scope.levelUp.image = args.image;
      $scope.levelUp.prev_rank = args.prev_rank;
      $scope.levelUp.rank = args.rank;
      return $scope.modals.levelupModal.show();
    });
    $rootScope.$on('event:advice', function(event, args) {
      $scope.advice.name = args.name;
      $scope.modals.adviceModal.show();
      return $timeout(function() {
        return $scope.modals.adviceModal.hide();
      }, 2000);
    });
    $rootScope.$on('event:medal', function(event, args) {
      $scope.modals.medalModal.show();
      return $timeout(function() {
        return $scope.modals.medalModal.hide();
      }, 4000);
    });
    $scope.$on("$destroy", function() {
      $scope.modals.loginModal.remove();
      $scope.modals.levelupModal.remove();
      return $scope.modals.adviceModal.remove();
    });
    return saveDeviceToken();
  });

  this.AppCtrl.$inject = ['$scope', '$rootScope', '$state', '$ionicModal', '$timeout', 'CONFIG'];

}).call(this);
