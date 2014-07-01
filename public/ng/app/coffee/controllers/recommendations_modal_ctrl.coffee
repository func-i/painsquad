'use strict'

@RecommendationsModalCtrl = @controllerModule.controller 'RecommendationsModalCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, Favorites, Activity) ->
  $scope.selectedItem = {}

  $ionicModal.fromTemplateUrl "templates/advice/modal.base.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()
    if $scope.audio
      $scope.audio.stop()
      $scope.audio.release()

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
    $scope.audio = new Media(src, onSuccess, onError)
    if $scope.mediaPlaying
      $scope.audio.pause()
      $scope.mediaPlaying = !$scope.mediaPlaying
    else
      $scope.audio.play()
      $scope.mediaPlaying = !$scope.mediaPlaying

    # unless $scope.mediaPlaying
    #   $scope.audio.play()
    #   $scope.mediaPlaying = true
    # unless mediaTimer?
    #   mediaTimer = setInterval(->
    #     audio.getCurrentPosition ((position) ->
    #       setAudioPosition (position) + " sec"  if position > -1
    #     ), (e) ->
    #       console.log "Error getting pos=" + e
    #       setAudioPosition "Error: " + e
    #   , 1000)

  $scope.pauseAudio = ->
    if $scope.audio and $scope.mediaPlaying
      $scope.audio.pause()
      $scope.mediaPlaying = false

  onSuccess = ->
    console.log "playAudio():Audio Success"

  onError = (error) ->
    console.log "playAudio():Audio Failure"
    # alert "code: " + error.code + "\n" + "message: " + error.message + "\n"

  # $scope.stopAudio = ->
  #   audio.stop() if audio
  #   clearInterval mediaTimer
  #   mediaTimer = null

  # setAudioPosition = (position) ->
  #   document.getElementById("audio_position").innerHTML = position


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

@RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'Favorites', 'Activity']
