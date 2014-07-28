'use strict'

@RecommendationsModalCtrl = @controllerModule.controller 'RecommendationsModalCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $ionicScrollDelegate, $timeout, Favorites, Activity) ->
  $scope.selectedItem = {}
  $scope.showInit     = true

  $ionicModal.fromTemplateUrl "templates/advice/modal.base.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
    if event.target.tagName is 'IMG' and event.target.className is 'fav'
      $scope.toggleFavorite(item)
    else # load the modal
      $scope.modalStyle = item.style
      setHeaderButtons(item)
      $scope.selectedItem = item
      $scope.modal.show()
      $ionicScrollDelegate.scrollTop()

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
    "./images/advice/audio/#{src}.mp3"

  $scope.discardAdvice = ->
    closeModal()

  closeModal = ->
    $scope.modal.hide()
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

@RecommendationsModalCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$ionicScrollDelegate', '$timeout', 'Favorites', 'Activity']
