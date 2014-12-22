'use strict'

# if cordova, render video webkit inline video
# if browser, launch in modal and use videogular shit
@VideoCtrl = @controllerModule.controller 'VideoCtrl',  ($ionicPlatform, $rootScope, $state, $scope, $ionicModal, $sce, $timeout, UserAgentService, CONFIG) ->
  $scope.isCordova       = $rootScope.isCordova
  $scope.videoItem       = {}
  $scope.API             = null
  $scope.showInlineVideo = false

  $scope.$on 'event:playVideo', (ev, data) ->      
    $scope.videoItem.video_path = data
    $scope.sources = [{src: $scope.trustSrc(data), type: 'video/mp4'}]
    $scope.theme = "#{CONFIG.baseUrl}/lib/videogular-themes-default/videogular.css"

    if ionic.Platform.isIOS()
      $scope.showInlineVideo = true
    else
      loadModal()  
    
  loadModal = ->
    $ionicModal.fromTemplateUrl "templates/shared/modal.video.html", (modal) ->
      $scope.videoModal = modal
    ,
      animation: "slide-in-up"
      scope: $scope

    $timeout ->
      $scope.videoModal.show()      
      $scope.API.play()
    , 50
  
  isMobileSafari = ->
    if window.navigator.userAgent.match(/(iPod|iPhone|iPad)/) and window.navigator.userAgent.match(/AppleWebKit/)
      true
    else
      false

  $scope.onPlayerReady = (API) ->
    $scope.API = API

  $scope.trustSrc = (src) ->
    $sce.trustAsResourceUrl(src)

  $scope.videoComplete = ->
    $timeout ->
      $scope.videoModal.remove()
    , 200

  $scope.closeVideoModal = ->    
    $scope.videoModal.remove()
    $scope.API.pause()    

@VideoCtrl.$inject = [ '$rootScope', '$state', '$scope', '$ionicModal', '$sce', '$timeout', 'UserAgentService', 'CONFIG' ]