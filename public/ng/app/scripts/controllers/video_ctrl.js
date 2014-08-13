(function() {
  'use strict';
  this.VideoCtrl = this.controllerModule.controller('VideoCtrl', function($rootScope, $state, $scope, $ionicModal, $sce, $timeout, UserAgentService) {
    var isMobileSafari;
    $scope.isCordova = $rootScope.isCordova;
    $scope.videoItem = {};
    $scope.API = null;
    $scope.showInlineVideo = false;
    $scope.$on('event:playVideo', function(ev, data) {
      $scope.videoItem.video_path = data;
      if (UserAgentService() === 'chrome' || UserAgentService() === 'safari' && !isMobileSafari()) {
        $ionicModal.fromTemplateUrl("templates/shared/modal.video.html", function(modal) {
          return $scope.videoModal = modal;
        }, {
          animation: "slide-in-up",
          scope: $scope
        });
        $timeout(function() {
          return $scope.videoModal.show();
        }, 50);
      }
      if (isMobileSafari()) {
        return $scope.showInlineVideo = true;
      }
    });
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
        return $scope.videoModal.hide();
      }, 200);
    };
    return $scope.closeVideoModal = function() {
      $scope.videoModal.hide();
      return $scope.API.pause();
    };
  });

  this.VideoCtrl.$inject = ['$rootScope', '$state', '$scope', '$ionicModal', '$sce', '$timeout', 'UserAgentService'];

}).call(this);
