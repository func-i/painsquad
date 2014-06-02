'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, recommendations, Favorites) ->
  $scope.data              = {}
  $scope.data.recommended  = recommendations.advice.recommendations
  $scope.data.favorites    = []
  $scope.data.selectedItem = {}

  $ionicModal.fromTemplateUrl "templates/advice/modal/base-modal.html", (modal) ->
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
      $scope.data.selectedItem = item
      $scope.modal.show()

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(recommendation_id: item.id)
    else
      Favorites.remove(recommendation_id: item.id)

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

  # TODO: advice scoring
  $scope.adviceCompleted = ->
    console.log "+5 Bonus Points Awarded"
    reset()
    $scope.modal.hide()

  $scope.discardAdvice = ->
    reset()
    $scope.modal.hide()

  setHeaderButtons = (item) ->
    if item.style is 'slideshow'
      $scope.showStartButton = true
    else
      $scope.showDidItButton = true

  reset = ->
    $scope.slideShowActivated = null
    $scope.data.selectedItem       = null
    $scope.modalStyle         = null
    $scope.showStartButton    = null
    $scope.showDidItButton    = null

@RecommendationsCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'recommendations']
