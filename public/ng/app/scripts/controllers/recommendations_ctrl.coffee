'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $stateParams, $ionicModal, $ionicSlideBoxDelegate, $timeout, adviceResource) ->
  $scope.data              = {}
  $scope.data.recommended  = adviceResource.advice.recommendations

  $ionicModal.fromTemplateUrl "templates/advice/modal/base-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$stateChangeStart', ->
    $scope.modal.remove()

  # $scope.$on '$destroy', ->
  #   $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
    # <i> element clicks bound to ng-model, ignore this event
    if event.target.tagName.toLowerCase() isnt 'i'
      $scope.modalStyle = item.style
      setHeaderButtons(item)
      $scope.data.selectedItem = item
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

  $scope.loadNestedModal = (item) ->
    console.log item

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
    $scope.data.selectedItem  = null
    $scope.modalStyle         = null
    $scope.showStartButton    = null
    $scope.showDidItButton    = null

@RecommendationsCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'adviceResource']
