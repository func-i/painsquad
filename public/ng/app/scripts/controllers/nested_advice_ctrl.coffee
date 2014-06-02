'use strict'

@NestedAdviceCtrl = @controllerModule.controller 'NestedAdviceCtrl', ($scope, $state, $stateParams, $ionicModal) ->

  $ionicModal.fromTemplateUrl "templates/advice/modal.steps.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

  $scope.$on '$destroy', ->
    $scope.modal.remove()

  $scope.loadNestedModal = (item) ->
    $scope.nestedSelection = item
    $scope.modal.show()

@NestedAdviceCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']
