'use strict'

@ChecklistExtraCtrl = @controllerModule.controller "ChecklistExtraCtrl", ($scope, $state, $stateParams, $ionicModal) ->
  $scope.detailData =
    currentChoice = {}

  $ionicModal.fromTemplateUrl "templates/surveys/questions/modal.checklist.html", (modal) ->
    $scope.modal = modal
  ,
    animation: "slide-in-up"
    scope: $scope

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
      if choice.textfield
        inverse = true if choice.selected and choice.value and choice.value.length > 5
      else if choice.selected
        inverse = true
    !inverse

@ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal']