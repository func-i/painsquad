(function() {
  'use strict';
  this.VideoCtrl = this.controllerModule.controller('VideoCtrl', function($ionicPlatform, $rootScope, $state, $scope, $ionicModal, $sce, $timeout, UserAgentService, CONFIG) {
    var isMobileSafari, loadModal;
    $scope.isCordova = $rootScope.isCordova;
    $scope.videoItem = {};
    $scope.API = null;
    $scope.showInlineVideo = false;
    $scope.$on('event:playVideo', function(ev, data) {
      $scope.videoItem.video_path = data;
      $scope.sources = [
        {
          src: $scope.trustSrc(data),
          type: 'video/mp4'
        }
      ];
      $scope.theme = CONFIG.baseUrl + "/lib/videogular-themes-default/videogular.css";
      if (ionic.Platform.isIOS()) {
        return $scope.showInlineVideo = true;
      } else {
        return loadModal();
      }
    });
    loadModal = function() {
      $ionicModal.fromTemplateUrl("templates/shared/modal.video.html", function(modal) {
        return $scope.videoModal = modal;
      }, {
        animation: "slide-in-up",
        scope: $scope
      });
      return $timeout(function() {
        $scope.videoModal.show();
        return $scope.API.play();
      }, 50);
    };
    isMobileSafari = function() {
      if (window.navigator.userAgent.match(/(iPod|iPhone|iPad)/) && window.navigator.userAgent.match(/AppleWebKit/)) {
        return true;
      } else {
        return false;
      }
    };
    $scope.onPlayerReady = function(API) {
      return $scope.API = API;
    };
    $scope.trustSrc = function(src) {
      return $sce.trustAsResourceUrl(src);
    };
    $scope.videoComplete = function() {
      return $timeout(function() {
        return $scope.videoModal.remove();
      }, 200);
    };
    return $scope.closeVideoModal = function() {
      $scope.videoModal.remove();
      return $scope.API.pause();
    };
  });

  this.VideoCtrl.$inject = ['$rootScope', '$state', '$scope', '$ionicModal', '$sce', '$timeout', 'UserAgentService', 'CONFIG'];

}).call(this);
