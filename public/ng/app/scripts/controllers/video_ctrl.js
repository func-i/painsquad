(function() {
  'use strict';
  this.VideoCtrl = this.controllerModule.controller('VideoCtrl', function($rootScope, $state, $scope, $ionicModal, $sce) {
    console.log('VideoCtrl Init, isCordova? ', $rootScope.isCordova);
    $scope.isCordova = $rootScope.isCordova;
    $scope.$on('event:playVideo', function() {
      return console.log('event:playVideo detected');
    });
    $ionicModal.fromTemplateUrl("templates/shared/modal.video.html", function(modal) {
      return $scope.videoModal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.playVideo = function() {
      $scope.videoItem = $scope.selectedItem;
      return $scope.videoModal.show();
    };
    $scope.videoComplete = function() {
      return $scope.videoModal.hide();
    };
    return $scope.trustSrc = function(src) {
      return $sce.trustAsResourceUrl(src);
    };
  });

  this.VideoCtrl.$inject = ['$rootScope', '$state', '$scope', '$ionicModal', '$sce'];

}).call(this);
