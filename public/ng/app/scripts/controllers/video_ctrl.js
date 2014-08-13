(function() {
  'use strict';
  this.VideoCtrl = this.controllerModule.controller('VideoCtrl', function($rootScope, $state, $scope, $ionicModal, $sce, $timeout) {
    $scope.isCordova = $rootScope.isCordova;
    $scope.videoItem = {};
    $scope.$on('event:playVideo', function(ev, data) {
      $scope.videoItem.video_path = data;
      if (!$scope.isCordova) {
        $ionicModal.fromTemplateUrl("templates/shared/modal.video.html", function(modal) {
          return $scope.videoModal = modal;
        }, {
          animation: "slide-in-up",
          scope: $scope
        });
        return $timeout(function() {
          return $scope.videoModal.show();
        }, 50);
      }
    });
    $scope.videoComplete = function() {
      return $scope.videoModal.hide();
    };
    return $scope.trustSrc = function(src) {
      return $sce.trustAsResourceUrl(src);
    };
  });

  this.VideoCtrl.$inject = ['$rootScope', '$state', '$scope', '$ionicModal', '$sce', '$timeout'];

}).call(this);
