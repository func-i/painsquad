'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $stateParams, $ionicModal, $ionicSlideBoxDelegate, $timeout, adviceResource) ->
  $scope.data              = {}
  $scope.data.recommended  = adviceResource.advice.recommendations
  $scope.data.selectedItem = {}

  $ionicModal.fromTemplateUrl "templates/advice/advice-modal.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadAdviceModal = (item) ->
    $scope.data.adviceSlides = item
    $scope.modal.show()
    $ionicSlideBoxDelegate.update()

  $scope.slideChange = (index) ->
    console.log index
    $scope.slideIndex = index


@RecommendationsCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal', '$ionicSlideBoxDelegate', '$timeout', 'adviceResource']
