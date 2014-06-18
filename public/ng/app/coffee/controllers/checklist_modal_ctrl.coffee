'use strict'

@ChecklistModalCtrl = @controllerModule.controller "ChecklistModalCtrl", ($scope, $state, $stateParams, $ionicModal) ->

  $scope.ifSliderNull = (choice) ->
    if choice and !(choice.value? || choice.slider_disabled is true)
      true

  $scope.ifTextareaPresent = (choice) ->
    if choice and !(choice.custom_text and choice.custom_text.length < 5)
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

@ChecklistModalCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']
