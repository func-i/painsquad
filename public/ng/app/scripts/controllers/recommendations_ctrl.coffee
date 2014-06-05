'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $ionicModal, $ionicSlideBoxDelegate, $timeout, recommendations, Favorites, Activity) ->
  $scope.recommendedItems   = recommendations
  $scope.favorites          = []
  $scope.selectedItem       = {}
  $scope.showFavoriteButton = true

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

  $scope.toggleFavorite = (item) ->
    item.favorite = !item.favorite
    if item.favorite
      Favorites.save(favorite: { recommendation_id: item.id })
      # Favorites.save(recommendation_id: item.id)
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

  # TODO: only allow bonus points if completed after a valid submission, prevent cheating!
  $scope.adviceCompleted = ->
    Activity.save(activity: { subject_id: $scope.selectedItem.id, subject_type: 'Recommendation', event: 'recommendation_complete' })
    $scope.modal.hide()
    reset()

  $scope.discardAdvice = ->
    $scope.modal.hide()
    reset()

  setHeaderButtons = (item) ->
    if item.style is 'slideshow'
      $scope.showStartButton = true
    else
      $scope.showDidItButton = true

  reset = ->
    $scope.slideShowActivated = null
    $scope.selectedItem       = null
    $scope.modalStyle         = null
    $scope.showStartButton    = null
    $scope.showDidItButton    = null

@RecommendationsCtrl.$inject = ['$scope', '$state', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'recommendations', 'Favorites', 'Activity']
