'use strict'

@RecommendationsModalCtrl = @controllerModule.controller 'RecommendationsModalCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, AudioPlayer, Favorites, Activity) ->
  $scope.selectedItem = {}
  $scope.showInit     = true
  $scope.player       = AudioPlayer
  $scope.mediaPlaying = false
  # $scope.progress     = if $scope.player.progress() then $scope.player.progress() else 0.5

  $ionicModal.fromTemplateUrl "templates/advice/modal.base.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
    # <i> element clicks bound to ng-model, ignore this event
    if event.target.tagName.toLowerCase() is 'i' or event.target.className.toLowerCase() is 'badge'
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

  $scope.adviceCompleted = ->
    Activity.save(activity: { subject_id: $scope.selectedItem.id, subject_type: 'Recommendation', event: 'recommendation_complete' })
    closeModal()

  $scope.initAudio = (src) ->
    $scope.player.initAudio(src)
    $scope.player.play()
    $scope.showInit     = false
    $scope.mediaPlaying = true

  $scope.pauseAudio = ->
    $scope.player.pause()
    $scope.mediaPlaying = false

  $scope.resumeAudio = ->
    $scope.player.play()
    $scope.mediaPlaying = true

  $scope.stopAudio = ->
    $scope.player.stop()
    $scope.mediaPlaying = false

  $scope.discardAdvice = ->
    closeModal()

  $scope.$watch (->
    AudioPlayer.progress
  ), ((newVal, oldVal) ->
    console.log newVal
    console.log oldVal
  ), true

  closeModal = ->
    $scope.modal.hide()
    $scope.stopAudio()
    resetState()

  setHeaderButtons = (item) ->
    if item.style is 'slideshow'
      $scope.showStartButton = true
    else
      $scope.showDidItButton = true

  resetState = ->
    $scope.slideShowActivated = null
    $scope.modalStyle         = null
    $scope.showStartButton    = null
    $scope.showDidItButton    = null
    $scope.selectedItem       = null

@RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'AudioPlayer', 'Favorites', 'Activity']
