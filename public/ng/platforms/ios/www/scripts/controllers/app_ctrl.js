(function() {
  'use strict';
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $rootScope, $state, $ionicModal, $ionicPopup, $timeout, CONFIG, TokenResource, ModalService, AuthService, UserService) {
    var saveDeviceToken;
    $scope.levelUp = {};
    $scope.advice = {};
    ModalService.registerModals($scope);
    $scope.closeModal = function() {
      return $scope.modals.levelupModal.hide();
    };
    $scope.closeAdvice = function() {
      return $scope.adviceModal.hide();
    };
    $scope.playLevelupVideo = function() {
      var path;
      path = "" + CONFIG.baseUrl + "/videos/ranks/" + $scope.levelUp.image + ".m4v";
      return $scope.$broadcast('event:playVideo', path);
    };
    $scope.isMobile = function() {
      return ionic.Platform.isIOS() || ionic.Platform.isAndroid();
    };
    saveDeviceToken = function() {
      if ($rootScope.deviceToken) {
        return TokenResource.update({
          device_token: $rootScope.deviceToken
        });
      }
    };
    $scope.logout = function() {
      var confirmPopup;
      return confirmPopup = $ionicPopup.confirm({
        title: 'Log out',
        template: 'Are you sure you want to log out?',
        buttons: [
          {
            text: "<span class='content'>No</span>",
            type: 'button-stable'
          }, {
            text: "<span class='content'>Yes</span>",
            type: 'button-positive',
            onTap: function(ev) {
              return AuthService.logout();
            }
          }
        ]
      });
    };
    $rootScope.$on('event:levelup', function(event, args) {
      $scope.levelUp.image = args.image;
      $scope.levelUp.prev_rank = args.prev_rank;
      $scope.levelUp.rank = args.rank;
      return $scope.modals.levelupModal.show();
    });
    $rootScope.$on('event:genericModal', function(event, args) {
      $scope.modalContent = args.modal_content;
      $scope.modals.genericModal.show();
      return $timeout(function() {
        return $scope.modals.genericModal.hide();
      }, 7000);
    });
    $scope.$on("$destroy", function() {
      if ($scope.modals.loginModal) {
        $scope.modals.loginModal.remove();
      }
      if ($scope.modals.levelupModal) {
        $scope.modals.levelupModal.remove();
      }
      if ($scope.modals.genericModal) {
        return $scope.modals.genericModal.remove();
      }
    });
    return $rootScope.$watch("deviceToken", function(token) {
      return saveDeviceToken();
    });
  });

  this.AppCtrl.$inject = ['$scope', '$rootScope', '$state', '$ionicModal', '$ionicPopup', '$timeout', 'CONFIG', 'TokenResource', 'ModalService', 'AuthService', 'UserService'];

}).call(this);