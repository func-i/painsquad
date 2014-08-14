'use strict'

# if cordova, render video webkit inline video
# if browser, launch in modal and use videogular shit
@VideoCtrl = @controllerModule.controller 'VideoCtrl',  ($rootScope, $state, $scope, $ionicModal, $sce, $timeout, UserAgentService, VG_EVENTS) ->
  $scope.isCordova       = $rootScope.isCordova
  $scope.videoItem       = {}
  $scope.API             = null
  $scope.showInlineVideo = false

  # TODO:
    # - if user clicks 'done' before videoComplete, need to hide video
    # - fix on mobile safari, 'operation could not be completed' error
    # - fix webkitendfullscreen event using directive or something

  $rootScope.$on VG_EVENTS.ON_EXIT_FULLSCREEN, (ev) ->
    console.log 'event: ', ev
    $scope.showInlineVideo = false

  # $rootScope.$on VG_EVENTS.ON_TOGGLE_FULLSCREEN, (ev) ->
  #   console.log 'event: ', ev
  #   $scope.showInlineVideo = !$scope.showInlineVideo

  $scope.$on 'event:playVideo', (ev, data) ->
    $scope.videoItem.video_path = data
    if UserAgentService() is 'chrome' or UserAgentService() is 'safari' and !isMobileSafari()
      loadModal()
    if isMobileSafari()
      $scope.showInlineVideo = true

  loadModal = ->
    $ionicModal.fromTemplateUrl "templates/shared/modal.video.html", (modal) ->
      $scope.videoModal = modal
    ,
      animation: "slide-in-up"
      scope: $scope

    $timeout ->
      $scope.videoModal.show()
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
      $scope.videoModal.hide()
    , 200

  $scope.inlineVideoComplete = ->
    # $timeout ->
    #   $scope.showInlineVideo = false
    # , 50

  $scope.closeVideoModal = ->
    $scope.videoModal.hide()
    $scope.API.pause()

@VideoCtrl.$inject = [ '$rootScope', '$state', '$scope', '$ionicModal', '$sce', '$timeout', 'UserAgentService', 'VG_EVENTS' ]