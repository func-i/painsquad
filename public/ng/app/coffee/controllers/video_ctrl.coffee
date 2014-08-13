'use strict'

# if cordova, render video webkit inline video
# if browser, launch in modal and use videogular shit
@VideoCtrl = @controllerModule.controller 'VideoCtrl',  ($rootScope, $state, $scope, $ionicModal, $sce) ->
  console.log 'VideoCtrl Init, isCordova? ', $rootScope.isCordova
  $scope.isCordova = $rootScope.isCordova

  $scope.$on 'event:playVideo', ->
    console.log 'event:playVideo detected'

  $ionicModal.fromTemplateUrl "templates/shared/modal.video.html", (modal) ->
    $scope.videoModal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.playVideo = ->
    $scope.videoItem = $scope.selectedItem
    $scope.videoModal.show()

  $scope.videoComplete = ->
    $scope.videoModal.hide()

  $scope.trustSrc = (src) ->
    $sce.trustAsResourceUrl(src)

@VideoCtrl.$inject = [ '$rootScope', '$state', '$scope', '$ionicModal', '$sce' ]