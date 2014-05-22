'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $stateParams, $ionicModal, $ionicSlideBoxDelegate, $timeout, adviceResource) ->
  $scope.data              = {}
  $scope.data.recommended  = adviceResource.advice.recommendations

  $ionicModal.fromTemplateUrl "templates/advice/advice-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
    # <i> element clicks bound to ng-model, ignore this event
    if event.target.tagName.toLowerCase() isnt 'i'
      $scope.modalStyle = item.style
      setHeaderButtons(item)
      $scope.data.selectedItem = item
      $scope.modal.show()

  setHeaderButtons = (item) ->
    if item.style is 'slideshow'
      $scope.showStartButton = true
    else
      $scope.showDidItButton = true

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

  reset = ->
    $scope.slideShowActivated = false
    $scope.data.selectedItem  = null
    $scope.modalStyle         = null
    $scope.showStartButton    = null
    $scope.showDidItButton    = null

@RecommendationsCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'adviceResource']
