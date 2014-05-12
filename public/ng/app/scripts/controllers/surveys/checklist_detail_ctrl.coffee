'use strict'

@ChecklistDetailCtrl = @controllerModule.controller "ChecklistDetailCtrl", ($scope, $state, $stateParams, $ionicModal) ->

  $scope.ifSliderNull = (choice) ->
    if choice and !(choice.value? || choice.slider_disabled is true)
      true

  $scope.saveDetails = (choice) ->
    choice.selected = true
    $scope.modal.hide()

  $scope.discardDetails = (choice) ->
    choice.selected = false
    choice.value = null
    $scope.modal.hide()

  $scope.showSave = false

  $scope.$on 'detailModal:valid', (event) ->
    $scope.showSave = true

  $scope.$on 'detailModal:invalid', (event) ->
    $scope.showSave = false

@ChecklistDetailCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']
