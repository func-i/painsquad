'use strict'

# if cordova, render video webkit inline video
# if browser, launch in modal and use videogular shit
@VideoCtrl = @controllerModule.controller 'VideoCtrl',  ($rootScope, $state, $scope, $ionicModal, $sce, $timeout) ->
  $scope.isCordova = $rootScope.isCordova
  $scope.videoItem = {}

  $scope.$on 'event:playVideo', (ev, data) ->
    $scope.videoItem.video_path = data
    unless $scope.isCordova
      $ionicModal.fromTemplateUrl "templates/shared/modal.video.html", (modal) ->
        $scope.videoModal = modal
      ,
        animation: "slide-in-up"
        scope: $scope

      $timeout ->
        $scope.videoModal.show()
      , 50

  # $scope.playVideo = ->
  #   $scope.videoModal.show()

  $scope.videoComplete = ->
    $scope.videoModal.hide()

  $scope.trustSrc = (src) ->
    $sce.trustAsResourceUrl(src)

@VideoCtrl.$inject = [ '$rootScope', '$state', '$scope', '$ionicModal', '$sce', '$timeout' ]