'use strict'

@FavoritesCtrl = @controllerModule.controller 'FavoritesCtrl',  ($state, $scope, $ionicModal, $ionicSlideBoxDelegate, $timeout, UserService, favorites) ->
  $scope.favorites          = favorites.favorites
  $scope.isFavorites        = $scope.favorites.length > 0
  $scope.selectedItem       = {}
  $scope.showFavoriteButton = false

  $ionicModal.fromTemplateUrl "templates/advice/modal.base.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
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

  # TODO: advice scoring
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

@FavoritesCtrl.$inject = [ '$state', '$scope', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'UserService', 'favorites']
