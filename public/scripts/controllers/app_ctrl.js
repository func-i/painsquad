(function() {
  'use strict';
  this.AppCtrl = this.controllerModule.controller('AppCtrl', function($scope, $rootScope, $state, $ionicModal, $timeout, CONFIG, TokenResource) {
    var saveDeviceToken;
    $scope.levelUp = {};
    $scope.advice = {};
    $ionicModal.fromTemplateUrl('templates/shared/modal.login.html', function(modal) {
      return $scope.loginModal = modal;
    }, {
      scope: $scope,
      animation: 'fade-in',
      focusFirstInput: true
    });
    $ionicModal.fromTemplateUrl('templates/shared/levelup.html', function(modal) {
      return $scope.levelupModal = modal;
    }, {
      scope: $scope,
      animation: 'slide-left-right'
    });
    $ionicModal.fromTemplateUrl('templates/shared/advice.html', function(modal) {
      return $scope.adviceModal = modal;
    }, {
      scope: $scope,
      animation: 'slide-left-right'
    });
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
          token: $rootScope.deviceToken
        });
      }
    };
    $rootScope.$on('event:levelup', function(event, args) {
      $scope.levelUp.image = args.image;
      $scope.levelUp.prev_rank = args.prev_rank;
      $scope.levelUp.rank = args.rank;
      return $scope.levelupModal.show();
    });
    $rootScope.$on('event:advice', function(event, args) {
      $scope.advice.name = args.name;
      $scope.adviceModal.show();
      return $timeout(function() {
        return $scope.adviceModal.hide();
      }, 2000);
    });
    $scope.$on("$destroy", function() {
      $scope.loginModal.remove();
      $scope.levelupModal.remove();
      return $scope.adviceModal.remove();
    });
    return saveDeviceToken();
  });

  this.AppCtrl.$inject = ['$scope', '$rootScope', '$state', '$ionicModal', '$timeout', 'CONFIG'];

}).call(this);
