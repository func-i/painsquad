'use strict'

@FavoritesCtrl = @controllerModule.controller 'FavoritesCtrl',  ($state, $scope, $ionicModal, UserService, FavoritesResource) ->
  # $scope.currentUser  = UserService.currentUser()
  # $scope.isLoggedIn   = UserService.isLoggedIn()
  $scope.favorites    = FavoritesResource.favorites
  $scope.isFavorites  = $scope.favorites.length > 0
  $scope.selectedItem = {}

  $ionicModal.fromTemplateUrl "templates/advice/modal/base-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  # TODO: advice scoring
  $scope.adviceCompleted = ->
    console.log "+5 Bonus Points Awarded"
    reset()
    $scope.modal.hide()

  $scope.discardAdvice = ->
    reset()
    $scope.modal.hide()

  $scope.loadAdviceModal = (item) ->
    $scope.modalStyle = item.style
    setHeaderButtons(item)
    $scope.selectedItem = item
    $scope.modal.show()

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

@FavoritesCtrl.$inject = [ '$state', '$scope', '$ionicModal', 'UserService', 'FavoritesResource' ]

@FavoritesCtrl.resolve =
  FavoritesResource: (Favorites) ->
    Favorites.query().$promise
