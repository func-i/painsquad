'use strict'

@ChecklistExtraCtrl = @controllerModule.controller "ChecklistExtraCtrl", ($scope, $state, $stateParams, $ionicModal) ->
  $scope.detailData =
    currentChoice = {}

  $ionicModal.fromTemplateUrl "templates/surveys/questions/modal.checklist.html",
    scope: $scope
    animation: "slide-left-right"
  .then (modal) ->
    $scope.modal = modal


  $scope.$on '$destroy', ->
    $scope.modal.remove()

  # convenience method to pass choice object to checklist detail view
  $scope.goToSectionOrDisable = (choice) ->
    if @choice.can_disable
      $scope.disableAllChoices()
    else
      $scope.detailData.currentChoice = choice
      $scope.modal.show()

  $scope.isNotNone = ->
    if @choice.can_disable then false else true

  $scope.disableAllChoices = ->
    for choice in $scope.question.choices
      unless choice.can_disable
        choice.selected = false
        choice.disabled = !choice.disabled

  $scope.atLeastOne = ->
    inverse = null
    for choice in $scope.question.choices
      inverse = true if choice.selected
    !inverse

@ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']
