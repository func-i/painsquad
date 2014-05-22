'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $stateParams, $ionicModal, $ionicSlideBoxDelegate, $timeout, adviceResource) ->
  $scope.data              = {}
  $scope.data.recommended  = adviceResource.advice.recommendations
  $scope.slideIndex        = 0

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
      switch item.type
      when "basic"
      when "slideshow"
      when "nested"

      # $scope.isSlideshow       = false
      # $scope.data.selectedItem = item
      # $scope.modal.show()
      # $timeout ->
      #   $ionicSlideBoxDelegate.update()
      #   $ionicSlideBoxDelegate.slide(0)

  $scope.startSlideshow = ->
    $scope.isSlideshow = true
    $timeout -> $ionicSlideBoxDelegate.update()

  $scope.slideChange = (index) ->
    $scope.slideIndex = index

  # TODO: advice scoring
  $scope.adviceCompleted = ->
    console.log "+5 Bonus Points Awarded"
    $scope.modal.hide()


@RecommendationsCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'adviceResource']
