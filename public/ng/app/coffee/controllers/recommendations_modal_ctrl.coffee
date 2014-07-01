'use strict'

@RecommendationsModalCtrl = @controllerModule.controller 'RecommendationsModalCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, $interval, Favorites, Activity) ->
  $scope.selectedItem = {}
  $scope.audio = null

  $ionicModal.fromTemplateUrl "templates/advice/modal.base.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
    # <i> element clicks bound to ng-model, ignore this event
    if event.target.tagName.toLowerCase() is 'i'
      $scope.toggleFavorite(item)
    else # load the modal
      $scope.modalStyle = item.style
      setHeaderButtons(item)
      $scope.selectedItem = item
      $scope.modal.show()

  $scope.startSlideshow = ->
    $scope.slideIndex         = 0
    $scope.showStartButton    = false
    $scope.showDidItButton    = true
    $scope.slideShowActivated = true
    $timeout ->
      $ionicSlideBoxDelegate.update()
      $ionicSlideBoxDelegate.slide(0)

  $scope.slideChange = (index) ->
    $scope.slideIndex = index

  # TODO: only allow bonus points if completed after a valid submission, prevent cheating!
  $scope.adviceCompleted = ->
    Activity.save(activity: { subject_id: $scope.selectedItem.id, subject_type: 'Recommendation', event: 'recommendation_complete' })
    closeModal()

  $scope.discardAdvice = ->
    closeModal()

  $scope.playAudio = (src) ->
    src = "./images/advice/audio/#{src}.mp3"
    initAudio(src) unless $scope.audio
    if $scope.mediaPlaying
      $scope.audio.pause()
      $scope.mediaPlaying = !$scope.mediaPlaying
    else
      $scope.audio.play()
      $scope.mediaPlaying = !$scope.mediaPlaying

  # $scope.$watch '$scope.mediaPlaying', ->
  #   $interval ->
  #     $scope.audio.getCurrentPosition ((position) ->
  #       $scope.currentAudioPosition = position
  #       console.log "debuggin position from $scope.mediaPlaying watch ", position
  #     ), (e) ->
  #       console.log "Error getting pos=" + e
  #   , 1000

  initAudio = (src) ->
    $scope.audio = new Media(src, onAudioSuccess, onAudioError)

  onAudioSuccess = ->
    console.log "playAudio():Audio Success"

  onAudioError = (error) ->
    console.log "playAudio():Audio Failure"
    # alert "code: " + error.code + "\n" + "message: " + error.message + "\n"

  closeModal = ->
    $scope.modal.hide()
    reset()

  setHeaderButtons = (item) ->
    if item.style is 'slideshow'
      $scope.showStartButton = true
    else
      $scope.showDidItButton = true

  reset = ->
    $scope.slideShowActivated = null
    $scope.modalStyle         = null
    $scope.showStartButton    = null
    $scope.showDidItButton    = null
    $scope.selectedItem       = null
    if $scope.audio
      $scope.audio.stop()
      $scope.audio.release()

@RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', '$interval', 'Favorites', 'Activity']
